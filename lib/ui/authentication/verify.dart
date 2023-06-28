import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/logic/controllers/system_controller.dart';
import 'package:studio/route/route.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_background.dart';
import 'package:studio/widgets/get_message.dart';
import 'package:studio/widgets/pin_code_widget.dart';
import 'package:studio/widgets/stagger_animation.dart';

class VerifyCode extends StatefulWidget {
  final String phoneNumber;
  final String verId;
  final String sms;
//  final Stream<firebase_auth.PhoneAuthCredential> verifySuccessStream;

  VerifyCode({
    required  this.verId,
    required this.phoneNumber,
    required this.sms,
//      this.verifySuccessStream
  });

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> with TickerProviderStateMixin {
  AnimationController? _loginButtonController;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinCodeController = TextEditingController();

  bool hasError = false;
  String currentText = '';
  var onTapRecognizer;

//  Future<void> _verifySuccessStreamListener(
//      firebase_auth.PhoneAuthCredential credential) async {
//    if (credential != null && mounted) {
//      setState(() {
//        _pinCodeController.text = credential.smsCode;
//      });
//      FocusScope.of(context).requestFocus(FocusNode());
//    }
//  }

  @override
  void initState() {
    super.initState();

//    widget.verifySuccessStream?.listen(_verifySuccessStreamListener);

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    _loginButtonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    init();
  }
init() async{
    if(widget.sms.isNotEmpty)
 _pinCodeController.text='${widget.sms}' ;
}
  @override
  void dispose() {
//    widget.verifySuccessStream?.listen(null);
    _loginButtonController?.dispose();
    _pinCodeController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _loginButtonController?.forward();
    } on TickerCanceled {
      // printLog('[_playAnimation] error');
    }
  }

  Future<Null> _stopAnimation() async {
    try {
      await _loginButtonController?.reverse();
      setState(() {
        isLoading = false;
      });
    } on TickerCanceled {
      //  printLog('[_stopAnimation] error');
    }
  }

//  void _welcomeMessage(user, context) {
//
//     /* Tools.showSnackBar(
//          scaffoldKey.currentState, welcome + ' ${user.name} !');*/
//
//      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
//          'home', (Route<dynamic> route) => false);
//
//  }

  void _failMessage(message, context) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: 'close'.tr,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _loginSMS(String sms_code, context) async {

   // if(sms_code.isNotEmpty && widget.verId != null && widget.sms != null)
    {
      _playAnimation();
      try {
        print('verDat: ${widget.verId} kkk ${widget.sms} bbb${widget.verId}');
        await PostService().register2(widget.verId,_pinCodeController.text).then((response) async {
          print('${response.statusCode}  ${response.body}');
          _stopAnimation();
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
if(data['status']) {
  SharedPreferences shared_User =
  await SharedPreferences.getInstance();
  String token = data['Data'];
  await shared_User.setString('token', token);
  Get.put(SystemController(), permanent: true);
  await Get.find<SystemController>().getUser();
 // Get.offAllNamed(AppRoutes.main);
} else {
            print(response.body);
            var data = jsonDecode(response.body);

            GetMessageError(context,  "${data['message']}");
          }
          }
        });
      } catch (e) {

        print('e: $e');
        GetMessageError(context, "Connection Error");
      }

      // print('${fciAuthUserModel.user.email}');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(50)),
              /*Container(
                  width: ScreenUtil().setWidth(150),
                  child: Image.asset(kLogo)),*/
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(50),
                    vertical: ScreenUtil().setHeight(15)),
                child: Text(
                  'VerifyCode'.tr,
                  style: FCITextStyle.normal(22).copyWith(letterSpacing: .8),
                  //  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(50),
                    vertical: ScreenUtil().setHeight(15)),
                child: Text(
                  'PLZEnterCode'.tr,
                  style: FCITextStyle.normal(16),
                  //  textAlign: TextAlign.center,
                ),
              ),
              /*RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'resend'.tr,
                    recognizer: onTapRecognizer,
                    style: TextStyle(
                        fontFamily: 'Changa',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),*/
              SizedBox(height: ScreenUtil().setHeight(30)),
              /*Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(35),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      textDirection: TextDirection.ltr,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),*/
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(30),
                    vertical: ScreenUtil().setHeight(10)),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeWidget(
                    controller: _pinCodeController,
                    length: 4,
                    borderRadius: 10.0,
                    onChanged: (value) {
                      _loginSMS(value, context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(50),
                    vertical: ScreenUtil().setHeight(15)),
                child: Text(
                  'ResendPeriodic'.tr + '00:30',
                  style: FCITextStyle.normal(16),
                  //  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(100)),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: StaggerAnimation2(
                    titleButton: 'Login'.tr,
                    buttonController: _loginButtonController!,
                    onTap: () {
                      if (!isLoading) {
                        _loginSMS(_pinCodeController.text, context);
                        // changeNotifier.add(Functions.submit);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  Future<void> _signInWithCredential(
//      firebase_auth.PhoneAuthCredential credential) async {
//    final user =
//        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//    if (user != null) {
//      _stopAnimation();
//   //   _welcomeMessage(user, context);
//      var login = await Provider.of<AuthProvider>(context, listen: false)
//          .login('mohamed4shim@gmail.com', '12345678');
//
//      if (login) {
//        Navigator.of(context)
//            .pushReplacementNamed('main');
//      }
//    } else {
//      await _stopAnimation();
//      _failMessage('invalidSMSCode', context);
//    }
//  }
}
