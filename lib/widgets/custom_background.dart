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
                    filterQuality: FilterQuality.low,
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

class HomeBackground extends StatelessWidget {
  final Widget child;
  Widget? positionedchild;
  final String image;
  final bool showLogo;
  // final bool show;
  HomeBackground(
      {Key? key,
      required this.child,
      required this.image,
      this.positionedchild,
      this.showLogo = true
      // this.show = true,
      })
      : super(key: key);

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
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: ScreenUtil().setHeight(200),
                // decoration: BoxDecoration(
                //   color: FCIColors.primaryColor(),
                //   image: new DecorationImage(
                //     fit: BoxFit.cover,
                //     opacity: .4,
                //     alignment: Alignment.center,
                //     colorFilter: ColorFilter.mode(
                //         FCIColors.primaryColor(), BlendMode.dstATop),
                //     image: new AssetImage(
                //       'assets/images/back.jpg',
                //     ),
                //   ),
                // ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  alignment: Alignment.center,
                  //     fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(0),
              child: Container(
                width: size.width,
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(150, 0, 0, 0),
                      Color.fromARGB(150, 0, 0, 0),
                      Color.fromARGB(150, 0, 0, 0),
                      Color.fromARGB(150, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: showLogo
                    ? Image.asset(
                        'assets/images/logoWhite2.png',
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setHeight(120),
                        alignment: Alignment.center,
                        filterQuality: FilterQuality.low,
                        //  color: Colors.transparent,
                        // colorBlendMode: BlendMode.colorBurn,
                        fit: BoxFit.contain,
                        //     fit: BoxFit.cover),
                      )
                    : SizedBox(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(170)),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: child,
              ),
            ),
            if (positionedchild != null) positionedchild!,
          ],
        ),
      ),
    );
  }
}
