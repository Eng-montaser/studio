import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studio/utils/FCIStyle.dart';

class Background extends StatelessWidget {
  final Widget child;
  // final bool show;
  const Background({
    Key? key,
    required this.child,
    // this.show = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: ScreenUtil().setHeight(260),
                decoration: BoxDecoration(
                  color: FCIColors.primaryColor(),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                    colorFilter: ColorFilter.srgbToLinearGamma(),
                    image: new AssetImage(
                      'assets/images/back1.jpg',
                    ),
                  ),
                ),
                // child: Image.asset('assets/images/back1.jpg',
                //     fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(5),
              left: 0,
              right: 10,
              child: Container(
                //  width: size.width,
                //  height: size.height * .36,

                child: Image.asset(
                  'assets/images/logoWhite3.png',
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(210),
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  colorBlendMode: BlendMode.colorBurn,
                  fit: BoxFit.contain,
                  //     fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(190)),
                alignment: Alignment.topCenter,
                child: child),
          ],
        ),
      ),
    );
  }
}
