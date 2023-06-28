import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio/logic/controllers/system_controller.dart';
import 'package:studio/route/route.dart';

class SplashController extends GetxController {
  bool splashLoading = true;
  final PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      String? token= await sharedPreferences.getString('token');
      if(token != null){
        var sysController = Get.put(SystemController(), permanent: true);
        sysController.refreshToken();
        //sysController.getUser();
      }
     else
      Get.toNamed(AppRoutes.login);
      /* await sysController.init().then((value) {
        if (sysController.loginStatus) {
          if (sysController.showOnBoard) {
            splashLoading = false;
            update();
          } else {
            Get.offNamed(AppRoutes.main);
          }
        } else {
          if (sysController.showOnBoard) {
            splashLoading = false;
            update();
          } else {
            Get.offNamed(AppRoutes.login);
          }
        }
      });*/
    });
    // await databaseHelper.initTrans().then((value) {
    //
    // });
  }
}
