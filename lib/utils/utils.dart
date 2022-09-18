import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
class Utils {
  static Widget loading() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ) /* Image.asset(
        'assets/images/loading.gif',
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setHeight(100),
        fit: BoxFit.fill,
      )*/
      ,
    );
  }

  static Widget loadingTow(width) {
    return Center(
      child: Image.asset(
        'assets/images/loading.gif',
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(width),
        fit: BoxFit.fill,
      ),
    );
  }

  static double doubleParse(String value) {
    double result = 0.0;
    if (value != null && value.isNotEmpty) {
      result = double.parse(value);
    }
    return result;
  }
  static String dynamicToString(dynamic value) {
    String result = '';
    if (value != null) {
      result = value.toString();
    }
    return result;
  }
  static String uniqueIdGenerate() {
    var random = Random();
    // Math.Random random = new Math.Random(new DateTime.now().millisecond);
    final String hexDigits = "0123456789abcdef";
    List<String>? uuid =new List<String>.generate(36, (index) => '$index');
    for (int i = 0; i < 36; i++) {
      final int hexPos = random.nextInt(16);
      uuid[i] = (hexDigits.substring(hexPos, hexPos + 1));
    }
    int pos = (int.parse(uuid[19], radix: 16) & 0x3) | 0x8; // bits 6-7 of the clock_seq_hi_and_reserved to 01

    uuid[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    uuid[19] = hexDigits.substring(pos, pos + 1);
    uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";
    final StringBuffer buffer = new StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }
}
