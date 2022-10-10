import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:studio/ui/authentication/verify.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  TextEditingController textEditingControllerPhone =
      new TextEditingController();
  var vsync;
  late final AnimationController loginButtonController;
  final TextEditingController _textEditingControllerPhone =
      TextEditingController(text: '');
  String _connectionStatus = 'Unknown';
//  final Connectivity _connectivity = Connectivity();
//  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String? phoneNumber;
  String? _phone;
  var maskFormatter = new MaskTextInputFormatter(mask: '@&# ### ####', filter: {
    "@": RegExp(r'[0?٠]'),
    "&": RegExp(r'[5?٥]'),
    "#": RegExp(r'[0-9?٠-٩]')
  });

  LoginController({this.vsync});
  Future<Null> _playAnimation() async {
    try {
      isLoading.value = true;
      await loginButtonController.forward();
    } on TickerCanceled {
      // printLog('[_playAnimation] error');
    }
  }

  var animat = false.obs;
  Future<Null> _stopAnimation() async {
    try {
      await loginButtonController.reverse();
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

    Scaffold.of(context)
      // ignore: deprecated_member_use
      ..removeCurrentSnackBar()
      // ignore: deprecated_member_use
      ..showSnackBar(snackBar);
  }

  Future<void> sendCodeSMS(context) async {
    _playAnimation();
    Timer(const Duration(seconds: 2), () async {
      _stopAnimation();
      Get.to(() => VerifyCode(phoneNumber: '1234'));
    });
  }

  @override
  void onInit() {
    super.onInit();
    loginButtonController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );
  }

  init() {}
  @override
  void dispose() {
    if (textEditingControllerPhone != null)
      textEditingControllerPhone.dispose();
    super.dispose();
  }
}
