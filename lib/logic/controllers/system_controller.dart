import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio/database/services/get_service.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/models/user_data.dart';
import 'package:studio/route/route.dart';

class SystemController extends GetxController {
  GetService getService = GetService();
  PostService posService = PostService();


  SystemController();
  UserData? currentuser;
  @override
  void onInit() {
    super.onInit();
    //inits();

    //  init();
  }

  inits() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String code = await sharedPreferences.getString('locale') ?? 'en';
    if (code == 'en')
      await Get.updateLocale(Locale('en', 'US'));
    // Get.locale = null;
    else
      await Get.updateLocale(Locale('ar', 'EG'));

//sharedPreferences.setString('token', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjU0OTIyNDQ1MyIsInJvbGUiOiJDdXN0b21lcnMiLCJBZ2VuY3lfSUQiOiIxMDEzOSIsIlVzZXJJZCI6IjIwMjkxIiwibmJmIjoxNjg3ODE5MjA0LCJleHAiOjE2ODc4MjY0MDQsImlhdCI6MTY4NzgxOTIwNCwiaXNzIjoiaHR0cHM6Ly9zYXlhcmF0ZWNoLmNvbS8iLCJhdWQiOiJodHRwczovL3NheWFyYXRlY2guY29tLyJ9.d5AeLaYxvoZdodcxbdOCh72b-svwz8mKfMKCQonLnUw');
//

 // refreshToken();
  }
  updateLanguage(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (Get.locale?.languageCode == "en") {
      sharedPreferences.setString('locale', 'ar');
      await Get.updateLocale(Locale('ar', 'EG'));
    } else {
      sharedPreferences.setString('locale', 'en');
      await Get.updateLocale(Locale('en', 'US'));
    }
    //Phoenix.rebirth(context); // Restarting app
    Get.reset();
    
  }




  @override
  void dispose() {
    super.dispose();
  }


  getUser() async {
    try {
      await posService.getUser().then((response) async {
        print('userg: ${response.statusCode}  ${response.body}');
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
      if(data['status']){
          currentuser = UserData.fromJson(data['Data']);
          Get.offAllNamed(AppRoutes.main);}
        }
      });
    } on Exception catch (e) {
      print('usererror: $e');
      // TODO
    }
    ////new////
    // if(fromLogin??true)
    //   Get.offAllNamed(AppRoutes.main);
    // else {
    //   SharedPreferences sharedPreferences = await SharedPreferences
    //       .getInstance();
    //   String? usr = await sharedPreferences.getString('user');
    //   if (usr != null) {
    //     currentuser = UserData.fromJson(jsonDecode(usr));
    //     Get.offAllNamed(AppRoutes.main);
    //   }
    // } // update();
  }
  refreshToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? expires=await sharedPreferences.getString('expires');
    String? token=await sharedPreferences.getString('token');
    if((token != null && expires ==null) || (expires != null && DateTime.parse(expires).isBefore(DateTime.now())))
    {
      print('if1 ex $expires');
      await posService.refreshToken().then((response) async {
        print('user: ${response.statusCode}  ${response.body}');
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            sharedPreferences.setString('token', '${data['Data']['token']}');
            sharedPreferences.setString(
                'expires', '${data['Data']['expires']}');
            getUser();
            //Get.offAllNamed(AppRoutes.main);
          }
        }
      });
    }else{
      getUser();
      print('if2 ex $expires');
    }
    ////new////
    // if(fromLogin??true)
    //   Get.offAllNamed(AppRoutes.main);
    // else {
    //   SharedPreferences sharedPreferences = await SharedPreferences
    //       .getInstance();
    //   String? usr = await sharedPreferences.getString('user');
    //   if (usr != null) {
    //     currentuser = UserData.fromJson(jsonDecode(usr));
    //     Get.offAllNamed(AppRoutes.main);
    //   }
    // } // update();
  }
}