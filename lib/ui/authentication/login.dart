import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/login_controller.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_background.dart';
import 'package:studio/widgets/stagger_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: GetBuilder<LoginController>(
              init: LoginController(vsync: this),
              builder: (controller) {
                return SingleChildScrollView(
                  //  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      Container(
                        //height: ScreenUtil().setHeight(250),
                        width: ScreenUtil().setWidth(300),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login'.tr,
                                style: FCITextStyle.normal(22)
                                    .copyWith(letterSpacing: .8)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(45)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  style: FCITextStyle.normal(18)
                                      .copyWith(fontFamily: ''),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      /* contentPadding: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenUtil().setWidth(7),
                                          vertical:
                                              ScreenUtil().setHeight(7)),*/
                                      hintStyle: FCITextStyle.normal(18)
                                          .copyWith(fontFamily: ''),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(16),
                                            left: ScreenUtil().setWidth(8)),
                                        child: Image.asset(
                                          "assets/images/saudi.png",
                                          width: 40,
                                        ),
                                      ),
                                      suffixIcon: Container(
                                        width: ScreenUtil().setWidth(60),
                                        decoration: BoxDecoration(
                                            color: FCIColors.accentColor(),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                bottomLeft:
                                                    Radius.circular(10))),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(7)),
                                        margin: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(10)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '+966',
                                          style: FCITextStyle.bold(14),
                                        ),
                                      ),
                                      hintText: 'Ex: 051 234 5678'),
                                  keyboardType: TextInputType.phone,
                                  controller:
                                      controller.textEditingControllerPhone,
                                  inputFormatters: [controller.maskFormatter],
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setWidth(150)),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: StaggerAnimation2(
                                titleButton: 'SendCode'.tr,
                                buttonController:
                                    controller.loginButtonController,
                                onTap: () {
                                  // print('${phoneNumber.replaceAll(' ', '')}');
                                  controller.sendCodeSMS(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
