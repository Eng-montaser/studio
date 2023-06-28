import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/login_controller.dart';
import 'package:studio/route/route.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_background.dart';
import 'package:studio/widgets/custom_textfeild.dart';
import 'package:studio/widgets/stagger_animation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<RegisterScreen>
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
        backgroundColor: FCIColors.avatarColor(),
        body: Background(
          child: GetBuilder<AuthController>(
              init: AuthController(vsync: this),
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
                            Text('Register'.tr,
                                style: FCITextStyle.bold(22,color: Colors.black)
                                    .copyWith(letterSpacing: 1)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Container(
                        child: Column(
                          children: [
                            CustomTextField(onTap: (){
                              controller.setRegFocus(
                                  RegisterFocusNode.name, context);
                            },
                                controller: controller.textControllerRegName,
                                hintText: 'Name'.tr,
                                prefixicon: Icon(CupertinoIcons.person,color: FCIColors.primaryColor(),),

                                inputType: TextInputType.name,
                                focusNode: controller.focusNodeName,
                                onEditingComplete: (){
                                  controller.setRegFocus(
                                      RegisterFocusNode.email, context);
                                }),CustomTextField(onTap: (){
                              controller.setRegFocus(
                                  RegisterFocusNode.email, context);
                            },
                                controller: controller.textControllerRegemail,
                                hintText: 'Email'.tr,
                                focusNode: controller.focusNodeRegEmail,
                                inputType: TextInputType.emailAddress,
                                prefixicon: Icon(CupertinoIcons.mail,color: FCIColors.primaryColor(),),

                                onEditingComplete: (){
                                  controller.setRegFocus(
                                      RegisterFocusNode.phone, context);
                                }),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Card(
                                elevation: 5,
                                color: FCIColors.accentColor(),
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(25)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  focusNode: controller.focusNodePhone,
                                  onTap: (){
                                    controller.setRegFocus(
                                        RegisterFocusNode.phone, context);
                                  },
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
                                            color: FCIColors.avatarColor(),
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
                                  controller.textControllerRegPhone,
                                  onEditingComplete: (){
                                    controller.setRegFocus(
                                        RegisterFocusNode.password, context);
                                  },
                                  inputFormatters: [controller.maskFormatter],
                                ),
                              ),
                            ),
                            // CustomTextField(onTap: (){},
                            //     controller: controller.textControllerRegPhone,
                            //     hintText: 'Mobile'.tr,
                            //     inputType: TextInputType.phone,
                            //
                            //     onEditingComplete: (){}),
                            CustomTextField(onTap: (){
                              controller.setRegFocus(
                                  RegisterFocusNode.password, context);
                            },
                                controller: controller.textControllerRegpwd,
                                hintText: 'Password'.tr,
                                prefixicon: Icon(CupertinoIcons.lock,color: FCIColors.primaryColor(),),

                                focusNode: controller.focusNodeRegPassword,
                               obsecure: true,
                                onEditingComplete: (){
                                  controller.setRegFocus(
                                      RegisterFocusNode.confirmPassword, context);
                                }),
                            CustomTextField(onTap: (){
                              controller.setRegFocus(
                                  RegisterFocusNode.confirmPassword, context);
                            },
                                controller: controller.textControllerRegconpwd,
                                hintText: 'CPassword'.tr,
                                prefixicon: Icon(CupertinoIcons.lock,color: FCIColors.primaryColor(),),

                                focusNode: controller.focusNodeCPassword,
                               obsecure: true,
                                onEditingComplete: (){
                                  controller.setRegFocus(
                                      RegisterFocusNode.success, context);
                                }),

                            SizedBox(height: ScreenUtil().setWidth(30)),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: StaggerAnimation2(
                                titleButton: 'Register'.tr,
                                buttonController:
                                    controller.registerButtonController,
                                onTap: () {
                                  // print('${phoneNumber.replaceAll(' ', '')}');
                                  controller.register1(context);
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
        bottomSheet: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(45),
              vertical: ScreenUtil().setHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Yesaccount'.tr+' ',style: FCITextStyle.normal(16),),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.login);
                },
                child: Text('Login'.tr,style: FCITextStyle.bold(16,color: FCIColors.primaryColor()),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
