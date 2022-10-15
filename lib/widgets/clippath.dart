import 'package:flutter/material.dart';

class BottomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.92);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class TopClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0,0);
    path.lineTo(size.width,0);
    path.lineTo(size.width, size.height * 0.20);
    // path.moveTo(0,0);
    path.lineTo(0,size.height * 0.05);
    path.lineTo(0,0);
    // path.moveTo(0, size.height * 0.75);
    // path.lineTo(size.width, size.height * 0.92);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
//    path.quadraticBezierTo(
//        size.width / 2, size.height-ScreenUtil().setHeight(170),
//        size.width, size.height - ScreenUtil().setHeight(65));
//    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipTop extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    // Path path0 = Path();
    // path0.moveTo(size.width*0.7812500,size.height*0.0878125);
    // path0.cubicTo(size.width*0.5628958,size.height*0.1469500,size.width*0.1411458,size.height*0.2477000,0,size.height*0.2276625);
    // path0.quadraticBezierTo(0,size.height*0.2472312,0,size.height*0.3059375);
    // path0.lineTo(0,size.height);
    // path0.lineTo(size.width,size.height);
    // path0.lineTo(size.width,size.height*0.0650000);
    // path0.quadraticBezierTo(size.width*0.8886667,size.height*0.0617250,size.width*0.7812500,size.height*0.0878125);
    // path0.close();

    Path path0 = Path();
    path0.moveTo(size.width,size.height*0.1816266);
    path0.quadraticBezierTo(size.width*0.9145593,size.height*0.1580057,size.width*0.7002432,size.height*0.2059689);
    path0.quadraticBezierTo(size.width*0.2361702,size.height*0.2975389,0,size.height*0.2943706);
    path0.quadraticBezierTo(size.width*-0.0034347,size.height*0.4690099,0,size.height);
    path0.lineTo(size.width,size.height);
    path0.quadraticBezierTo(size.width*1.0422188,size.height*0.8036209,size.width,size.height*0.1816266);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}