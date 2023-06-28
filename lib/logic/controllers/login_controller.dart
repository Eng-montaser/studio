import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/logic/controllers/system_controller.dart';
import 'package:studio/ui/authentication/verify.dart';
import 'package:studio/widgets/get_message.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var normalLogin = true.obs;
  PostService postService = PostService();
  TextEditingController textEditingControllerPhone =
      new TextEditingController();
  TextEditingController textControllerRegPhone = new TextEditingController();
  TextEditingController textControllerRegName = new TextEditingController();
  TextEditingController textControllerUsername = new TextEditingController();
  TextEditingController textControllerRegpwd = new TextEditingController();
  TextEditingController textControllerpwd = new TextEditingController();
  TextEditingController textControllerRegconpwd = new TextEditingController();
  TextEditingController textControllerRegemail = new TextEditingController();
  var vsync;
  late final AnimationController loginButtonController;
  late final AnimationController registerButtonController;
  late final AnimationController normalLoginButtonController;

  String _connectionStatus = 'Unknown';
//  final Connectivity _connectivity = Connectivity();
//  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String? phoneNumber;
  String? regphoneNumber;
  String? _phone;
  var maskFormatter = new MaskTextInputFormatter(mask: '@# ### ####', filter: {
    "@": RegExp(r'[0-9?٠-٩]'),

    "#": RegExp(r'[0-9?٠-٩]')
  });

  AuthController({this.vsync});
  Future<Null> _playAnimation(AnimationController button) async {
    try {
      isLoading.value = true;
      await button.forward();
    } on TickerCanceled {
      // printLog('[_playAnimation] error');
    }
  }


  var animat = false.obs;
  Future<Null> _stopAnimation(AnimationController button) async {
    try {
      await button.reverse();
      isLoading.value = false;
    } on TickerCanceled {
      //printLog('[_stopAnimation] error');
    }
  }


  void _failMessage(message, context) {
    final snackBar = SnackBar(
      content: Text('⚠️: $message'),
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: 'close'.tr,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context)
      // ignore: deprecated_member_use
      ..removeCurrentSnackBar()
      // ignore: deprecated_member_use
      ..showSnackBar(snackBar);
  }
  changeLoginView(bool isNormal){
    normalLogin.value=isNormal;
    update();
  }
  Future<void> sendCodeSMS(context) async {
    _playAnimation(loginButtonController);
    try {
      await postService
          .loginst1('${textEditingControllerPhone.text}'.replaceAll(' ', ''))
          .then((response) async {
        print('${response.statusCode}  ${response.body}');
        _stopAnimation(loginButtonController);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            Get.offAll(() => VerifyCode(
                verId: '${data['Data']['id_step2']}',
                sms: '${data['Data']['smscode']}',
                phoneNumber: textControllerRegPhone.text));
            isLoading.value = false;
            update();
          } else {
            print(response.body);
            var data = jsonDecode(response.body);
            isLoading.value = false;
            update();
            GetMessageError(context, "${data['error']}");
          }
        }
      });
    } catch (e) {
      isLoading.value = false;
      update();
      print('e: $e');
      GetMessageError(context, "Connection Error");
    }
    update();
    // print('${fciAuthUserModel.user.email}');
  }
  Future<void> login(context) async {
    if (textControllerUsername.text.isEmpty) {
      GetMessageError(context, "Please insert UserName.".tr);
      setLoginFocus(LoginFocusNode.username, context);

    }else if (textControllerpwd.text.isEmpty) {
      GetMessageError(context, "Please insert Password.".tr);
      setLoginFocus(LoginFocusNode.password, context);

    } else {
      _playAnimation(normalLoginButtonController);
      try {
        await postService
            .login(textControllerUsername.text, textControllerpwd.text)
            .then((response) async {
          print('login ${response.statusCode}  ${response.body}');
          _stopAnimation(normalLoginButtonController);
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            if (data['status']) {
              SharedPreferences shared_User =
              await SharedPreferences.getInstance();
              String token = data['Date']['token'];
              await shared_User.setString('token', token);
              await shared_User.setString('expires', data['Date']['expires']);
              Get.put(SystemController(), permanent: true);
              await Get.find<SystemController>().getUser();
              //  Get.offAllNamed(AppRoutes.main);

              isLoading.value = false;
              update();
            } else {
             // print(response.body);

              isLoading.value = false;
              update();
              GetMessageError(context, "${data['error']}");
            }
          }
        });
      } catch (e) {
        isLoading.value = false;
        update();
        print('e: $e');
        GetMessageError(context, "Connection Error");
      }
      update();
    }
    // print('${fciAuthUserModel.user.email}');
  }

  @override
  void onInit() {
    super.onInit();
    loginButtonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );
    registerButtonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    ); normalLoginButtonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );
  }

  @override
  void dispose() {
    if (textEditingControllerPhone != null)
      textEditingControllerPhone.dispose();
    if (textControllerRegPhone != null) textControllerRegPhone.dispose();
    if (textControllerRegName != null) textControllerRegName.dispose();
    if (textControllerUsername != null) textControllerUsername.dispose();
    if (textControllerRegemail != null) textControllerRegemail.dispose();
    if (textControllerRegpwd != null) textControllerRegpwd.dispose();
    if (textControllerpwd != null) textControllerpwd.dispose();
    if (textControllerRegconpwd != null) textControllerRegconpwd.dispose();
    loginButtonController.dispose();
    registerButtonController.dispose();
    normalLoginButtonController.dispose();
    super.dispose();
  }

  bool emailValid = false;
  getEmailValid(TextEditingController editingController) {
    emailValid = GetUtils.isEmail(editingController.text);
    print('emailValid ${emailValid}');
    update();
    return emailValid;
  }

  register1(context) async {
    /// email empty validate
    if (textControllerRegName.text.isEmpty) {
      GetMessageError(context, "Please insert Name.".tr);
      setRegFocus(RegisterFocusNode.name, context);
      return false;
    }
    if (textControllerRegemail.text.isEmpty) {
      GetMessageError(context, "Please insert Email.".tr);
      setRegFocus(RegisterFocusNode.email, context);
      return false;
    }

    /// name Valid validate
    else if (!getEmailValid(textControllerRegemail)) {
      setRegFocus(RegisterFocusNode.email, context);
      GetMessageError(context, "Please insert a Valid Email.");
      return false;
    } else if (textControllerRegPhone.text.isEmpty) {
      setRegFocus(RegisterFocusNode.phone, context);
      GetMessageError(context, "Please insert a Valid Phone.");
      return false;
    }

    /// password empty validate
    else if (textControllerRegpwd.text.isEmpty) {
      setRegFocus(RegisterFocusNode.password, context);
      GetMessageError(context, "Please insert Password.");
      return false;
    }

    /// password [6 characters] validate
    else if (textControllerRegpwd.text.length < 6) {
      setRegFocus(RegisterFocusNode.password, context);
      GetMessageError(context, "The Password must be at least 6 characters.");
      return false;
    } else if (textControllerRegpwd.text != textControllerRegconpwd.text) {
      setRegFocus(RegisterFocusNode.password, context);
      GetMessageError(context, "Mismatch passwords.");
      return false;
    } else {
      isLoading.value = true;
      update();
      var map = {
        "name": "${textControllerRegName.text}",
        "pwd": "${textControllerRegpwd.text}",
        "email": "${textControllerRegemail.text}",
        "mobile": "${textControllerRegPhone.text.replaceAll(' ', '')}"
      };
      print('data is: $map');
      _playAnimation(registerButtonController);
      try {
        await postService.register1(map).then((response) async {
          print('${response.statusCode}  ${response.body}');
          _stopAnimation(registerButtonController);
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            if (data['status']) {
              Get.offAll(() => VerifyCode(
                  verId: '${data['Data']['id_step2']}',
                  sms: '${data['Data']['smscode']}',
                  phoneNumber: textControllerRegPhone.text));
              isLoading.value = false;
              update();
            } else {
              print(response.body);
              var data = jsonDecode(response.body);
              isLoading.value = false;
              update();
              GetMessageError(context, "${data['message']}");
            }
          }
        });
      } catch (e) {
        isLoading.value = false;
        update();
        print('e: $e');
        GetMessageError(context, "Connection Error");
      }
      update();
      // print('${fciAuthUserModel.user.email}');
    }
  }

  FocusNode focusNodeRegEmail = new FocusNode();
  FocusNode focusNodePhone = new FocusNode();
  FocusNode focusNodeName = new FocusNode();
  FocusNode focusNodeusername = new FocusNode();
  FocusNode focusNodeRegPassword = new FocusNode();
  FocusNode focusNodeLoginPassword = new FocusNode();
  FocusNode focusNodeCPassword = new FocusNode();
  RegisterFocusNode? registerFocusNode;
  LoginFocusNode? loginFocusNode;
  getRegFocusNode(context) {
    switch (registerFocusNode) {
      case RegisterFocusNode.name:
        FocusScope.of(context).requestFocus(focusNodeName);
        break;
      case RegisterFocusNode.email:
        FocusScope.of(context).requestFocus(focusNodeRegEmail);
        break;
      case RegisterFocusNode.phone:
        FocusScope.of(context).requestFocus(focusNodePhone);
        break;
      case RegisterFocusNode.password:
        FocusScope.of(context).requestFocus(focusNodeRegPassword);
        break;
      case RegisterFocusNode.confirmPassword:
        FocusScope.of(context).requestFocus(focusNodeCPassword);
        break;
      case RegisterFocusNode.success:
      case null:
        FocusScope.of(context).unfocus();
        break;
    }
  }
  getLoginFocusNode(context) {
    switch (loginFocusNode) {
      case LoginFocusNode.username:
        FocusScope.of(context).requestFocus(focusNodeusername);
        break;
      case LoginFocusNode.password:
        FocusScope.of(context).requestFocus(focusNodeLoginPassword);
        break;
     
      case LoginFocusNode.success:
      case null:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  setRegFocus(RegisterFocusNode focus, context) {
    registerFocusNode = focus;
    getRegFocusNode(context);
    update();
  } 
  setLoginFocus(LoginFocusNode focus, context) {
    loginFocusNode = focus;
    getLoginFocusNode(context);
    update();
  }
}

enum RegisterFocusNode {
  // image,
  email,
  name,
  phone,
  password,
  confirmPassword,
  success
}
enum LoginFocusNode {
  // image,
  username,
  
  password,
 
  success
}
