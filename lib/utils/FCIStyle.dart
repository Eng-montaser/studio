import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FCITextStyle {
  static TextStyle normal(int fontSize,
      {Color? color,
      String? fontFamily,
      double? height,
      FontStyle? fontStyle}) {
    return TextStyle(
        color: color != null ? color : Colors.black,
        fontFamily: Get.locale!.languageCode == 'ar' ? 'Almarai' : 'Roboto',
        fontWeight: FontWeight.normal,
        fontSize: ScreenUtil().setSp(fontSize),
        height: height,
        fontStyle: fontStyle != null ? fontStyle : FontStyle.normal);
  }

  static TextStyle bold(int fontSize,
      {Color? color,
      String? fontFamily,
      double? height,
      FontStyle? fontStyle}) {
    return TextStyle(
        color: color != null ? color : Colors.black,
        fontFamily: Get.locale!.languageCode == 'ar' ? 'Almarai' : 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(fontSize),
        height: height,
        fontStyle: fontStyle != null ? fontStyle : FontStyle.normal);
  }
}

class FCIColors {
  static Color sidebarBackGroundColor() => Color(0xffeaecf8);
  static Color iconColor() => Color(0xffe69736);
  static Color primaryColor() => Color(0xff3c3c3c);
  static Color accentColor() => Color(0xfff4f2f2);
  static Color bottomBarColor() => Color(0xffD6CFCF);
  static Color lightBlueColor() => Color(0xff7f91d4);
  static Color textFieldColor() => Color(0xffefeff1);
  static Color whiteColor() => Color(0xffffffff);
  static Color redtColor() => Color(0xffF54768);
  static Color redaccenttColor() => Color(0xff974063);
  static Color blackaccenttColor() => Color(0xff41436A);
  static Color lightorangColor() => Color(0xffFF9677);
  static Color greenColor() => Color(0xff75E2FF);
  static Color greenAccentColor() => Color(0xff98DAD9);
  static Color blueColor() => Color(0xff5689C0);
  static Color blackblueColor() => Color(0xff244D61);
  static Color backColor() => Color(0xffF3F1F1);
  static Color adsColor() => Color(0xff71543e);
  static Color textColor() => Color(0xff111111);
  static Color buttonColor2() => Color(0xffC4938C);
  static Color backColor2() => Color(0xffF5F1F1);
}

class FCISize {
  static double width(context) => MediaQuery.of(context).size.width;
  static double height(context) => MediaQuery.of(context).size.height;
}

class FCIPadding {
  static double cardMarginHorizontal = ScreenUtil().setWidth(20);
  static double cardMarginVertical = ScreenUtil().setHeight(20);
  static double textFieldPaddingHorizontal = ScreenUtil().setWidth(5);
  static double textFieldPaddingVertical = ScreenUtil().setHeight(5);
  static double cardPadding = 20;
  static EdgeInsets symmetric({double? width, double? height}) {
    return EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(width ?? 0),
        vertical: ScreenUtil().setHeight(height ?? 0));
  }

  static EdgeInsets only(
      {double? top, double? bottom, double? left, double? right}) {
    return EdgeInsets.only(
        left: ScreenUtil().setWidth(left ?? 0),
        right: ScreenUtil().setWidth(right ?? 0),
        top: ScreenUtil().setHeight(top ?? 0),
        bottom: ScreenUtil().setHeight(bottom ?? 0));
  }
}
