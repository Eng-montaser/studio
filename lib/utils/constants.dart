import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///***************************************
///    Enums                             *
///***************************************

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText
      .replaceAll(exp, '\n')
      .replaceAll('\n\n', '\n')
      .replaceAll('\n\n', '\n');
}

// String convertFromStringToRange(String rangeString) {
//   final value = new NumberFormat("#,###,##0", "en_US");
//
//   return '${value.format(double.parse(rangeString))}';
// }
String getInitials(String name) => name.trim().isNotEmpty
    ? name
        .trim()
        .split(RegExp(' +'))
        .map((s) => s[0])
        .take(2)
        .join()
        .toUpperCase()
    : '';
// Color stringToColor(String str) {
//   int hash = 0;
//   for (int i = 0; i < str.length; i++) {
//     hash = str.codeUnitAt(i) + ((hash << 5) - hash);
//   }
//
//   String color = '#';
//
//   for (int i = 0; i < 3; i++) {
//     var value = (hash >> (i * 8)) & 0xFF;
//     color += value.toRadixString(16);
//   }
//
//   color += "0";
//   color = color.substring(0,7);
//
//   return colorFromHex(color);
// }
Color stringToColor(String text) {
  var hash = 0;
  for (var i = 0; i < text.length; i++) {
    hash = text.codeUnitAt(i) + ((hash << 5) - hash);
  }
  final finalHash = hash.abs() % (256 * 256 * 256);
  final red = ((finalHash & 0xFF0000) >> 16);
  final blue = ((finalHash & 0xFF00) >> 8);
  final green = ((finalHash & 0xFF));
  final color = Color.fromRGBO(red, green, blue, 0.7);
  return color;
}

Color colorFromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

TextInputFormatter doubleTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'));

TextInputFormatter intTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
