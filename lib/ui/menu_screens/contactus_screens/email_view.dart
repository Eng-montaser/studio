import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_button.dart';
import 'package:studio/widgets/custom_textfeild.dart';

import '../../../logic/controllers/contact_us.dart';

class ContactUsEmailView extends StatefulWidget {
  const ContactUsEmailView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FCIColors.backColor(),
        elevation: 0,
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(40)),
          child: Builder(builder: (context) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: FCIColors.textColor(),
                    size: ScreenUtil().setSp(20),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "Email",
                  style: FCITextStyle.bold(18, color: FCIColors.textColor()),
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.search_rounded,
                //     color: Colors.white,
                //     size: ScreenUtil().setSp(35),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            );
          }),
        ),
      ),
      backgroundColor: FCIColors.backColor(),
      body: GetBuilder<ContactUsController>(
          init: ContactUsController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CustomTextField(
                        hintText: 'Email',
                        onTap: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.email, context);
                        },
                        onEditingComplete: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.subject, context);
                        },
                        inputType: TextInputType.text,
                        controller: controller.emailController,
                        focusNode: controller.emailFocusNode,
                      ),
                      CustomTextField(
                        hintText: 'Subject',
                        onTap: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.subject, context);
                        },
                        onEditingComplete: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.message, context);
                        },
                        inputType: TextInputType.text,
                        controller: controller.subjectController,
                        focusNode: controller.subjectFocusNode,
                      ),
                      CustomTextField(
                        hintText: 'Message',
                        onTap: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.message, context);
                        },
                        onEditingComplete: () {
                          controller.setFocus(
                              ContactUsEmailFocusNode.success, context);
                        },
                        inputType: TextInputType.multiline,
                        controller: controller.messageController,
                        focusNode: controller.messageFocusNode,
                        height: 100,
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () {
                      controller.send(context);
                    },
                    text: 'Send',
                  )
                ],
              ),
            );
          }),
    );
  }
}
