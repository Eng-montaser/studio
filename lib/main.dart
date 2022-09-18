import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/route/route.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/utils/languages.dart';

// bool SHOWONBOARD = true;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 800),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', 'SA'), //Get.deviceLocale,
        translations: Languages(),
        fallbackLocale: const Locale('en', 'US'),
        title: 'Studio Sys',
        theme: ThemeData(
          primaryColor: FCIColors.primaryColor(),
          fontFamily: 'Almarai',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //       primarySwatch: Colors.blue,
        ),
        getPages: AppRoutes.routes,
      ),
    );
  }
}
