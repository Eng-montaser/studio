import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/splash_controller.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  // bool splashLoading = true;
  // final PageController _pageController = PageController();
  // init() {
  //   Timer(const Duration(seconds: 2), () async {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: FCIColors.accentColor(),
          body: GetBuilder<SplashController>(
              init: SplashController(),
              builder: (contxt) {
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child:WidgetAnimator(
                            atRestEffect:  WidgetRestingEffects.size(),
                            child:  Image.asset(
                              'assets/images/logo.png',
                              height: FCISize.height(context) * 0.2,
                              width: FCISize.height(context) * 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}
