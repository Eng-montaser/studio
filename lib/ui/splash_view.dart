import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/splash_controller.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/clippath.dart';

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
    return Scaffold(
        backgroundColor: FCIColors.accentColor(),
        body: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (contxt) {
              return Stack(
                children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: FCIColors.primaryColor(),
                    ),
                    clipper: BottomClipPath(),
                  ),
                  Column(
                    children: [
                      Container(
                        height: FCISize.height(context) * 0.25,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/inviteImage.png',
                          height: FCISize.height(context) * 0.25,
                          width: FCISize.height(context) * 0.25,
                        ),
                      ),
                      Container(
                        height: FCISize.height(context) * 0.25,
                      ),
                    ],
                  ),
                ],
              );
            })

        // : OnBoard(
        //     pageController: _pageController,
        //     // Either Provide onSkip Callback or skipButton Widget to handle skip state
        //     onSkip: () {
        //       Get.toNamed(AppRoutes.login);
        //     },
        //     // Either Provide onDone Callback or nextButton Widget to handle done state
        //     onDone: () {
        //       Get.toNamed(AppRoutes.login);
        //     },
        //     onBoardData: onBoardData,
        //     titleStyles: const TextStyle(
        //       color: Colors.deepOrange,
        //       fontSize: 18,
        //       fontWeight: FontWeight.w900,
        //       letterSpacing: 0.15,
        //     ),
        //     descriptionStyles: TextStyle(
        //       fontSize: 16,
        //       color: Colors.brown.shade300,
        //     ),
        //     pageIndicatorStyle: const PageIndicatorStyle(
        //       width: 100,
        //       inactiveColor: Colors.deepOrangeAccent,
        //       activeColor: Colors.deepOrange,
        //       inactiveSize: Size(8, 8),
        //       activeSize: Size(12, 12),
        //     ),
        //     // Either Provide onSkip Callback or skipButton Widget to handle skip state
        //     skipButton: TextButton(
        //       onPressed: () {
        //         Get.toNamed(AppRoutes.login);
        //       },
        //       child: const Text(
        //         "Skip",
        //         style: TextStyle(color: Colors.deepOrangeAccent),
        //       ),
        //     ),
        //
        //   ),
        );
  }
}
