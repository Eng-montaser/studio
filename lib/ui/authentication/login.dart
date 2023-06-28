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
      child: GetBuilder<AuthController>(
          init: AuthController(vsync: this),
          builder: (controller) { return Scaffold(
        body: Background(
          child:
                 SingleChildScrollView(
                  //  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: normalLogin(controller),
                    secondChild:
                    otpLogin(controller),
                    crossFadeState: controller.normalLogin.value  ? CrossFadeState.showFirst
                        :CrossFadeState.showSecond,
                  )
                ),
        ),
        bottomSheet: controller.normalLogin.value?SizedBox(): Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(45),
              vertical: ScreenUtil().setHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Yesaccount'.tr+' ',style: FCITextStyle.normal(16),),
              GestureDetector(
                onTap: (){
                  controller.changeLoginView(true);
                },
                child: Text('Login'.tr,style: FCITextStyle.bold(16,color: FCIColors.primaryColor()),),
              )
            ],
          ),
        ),
      );
    })
    );
  }
  Widget normalLogin(AuthController controller){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(35),
        ),
        Container(
          //height: ScreenUtil().setHeight(250),
          //  width: ScreenUtil().setWidth(300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login'.tr,
                  style: FCITextStyle.bold(22,color: Colors.black)
                      .copyWith(letterSpacing: .8)),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(100),
        ),
        CustomTextField(onTap: (){
          controller.setLoginFocus(
              LoginFocusNode.username, context);
        },
            controller: controller.textControllerUsername,
            hintText: 'Username'.tr,
            inputType: TextInputType.name,
            focusNode: controller.focusNodeusername,
            prefixicon: Icon(CupertinoIcons.person,color: FCIColors.primaryColor(),),
            onEditingComplete: (){
              controller.setLoginFocus(
                  LoginFocusNode.password, context);
            }),
        CustomTextField(onTap: (){
          controller.setLoginFocus(
              LoginFocusNode.password, context);
        },
            controller: controller.textControllerpwd,
            hintText: 'Password'.tr,
            obsecure: true,
            focusNode: controller.focusNodeLoginPassword,
            prefixicon: Icon(CupertinoIcons.lock,color: FCIColors.primaryColor(),),

            onEditingComplete: (){
              controller.setLoginFocus(
                  LoginFocusNode.success, context);
            }),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30),
              vertical: ScreenUtil().setHeight(0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Noaccount'.tr+' ',style: FCITextStyle.normal(18),),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.register);
                },
                child: Text('Register'.tr,style: FCITextStyle.bold(18,color: FCIColors.primaryColor()),),
              )
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(40)),
        StaggerAnimation2(
          titleButton: 'Login'.tr,
          buttonController:
          controller.normalLoginButtonController,
          onTap: () {
            // print('${phoneNumber.replaceAll(' ', '')}');
            controller.login(context);
          },
        ),
        SizedBox(height: ScreenUtil().setHeight(40)),
        Text('OR'.tr,style: FCITextStyle.bold(18,color: Colors.black),),
        SizedBox(height: ScreenUtil().setHeight(40)),
        GestureDetector(
          onTap: (){
            controller.changeLoginView(false);
          },
          child: Text('OTP'.tr,style: FCITextStyle.bold(18,color: FCIColors.primaryColor()),),
        )
      ],
    );
  }
  Widget otpLogin(AuthController controller){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        Container(
          //height: ScreenUtil().setHeight(250),
          //  width: ScreenUtil().setWidth(300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login'.tr,
                  style: FCITextStyle.bold(22,color: Colors.black)
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
                  color: FCIColors.accentColor(),
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
                    controller.textEditingControllerPhone,
                    inputFormatters: [controller.maskFormatter],
                  ),
                ),
              ),

              SizedBox(height: ScreenUtil().setWidth(100)),
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
    );
  }
}
