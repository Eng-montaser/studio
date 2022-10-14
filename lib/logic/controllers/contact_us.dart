import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/widgets/get_message.dart';

import '../../database/models/user_model.dart';

class ContactUsController extends GetxController {
 RxBool isLoading=false.obs;
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    if (emailController != null) emailController.dispose();
    if (subjectController != null) subjectController.dispose();
    if (messageController != null) messageController.dispose();
    super.onClose();
  }
 TextEditingController emailController =   TextEditingController();
 TextEditingController subjectController =   TextEditingController();
 TextEditingController messageController =   TextEditingController();

 ContactUsEmailFocusNode? contactUsEmailFocusNode;
 FocusNode emailFocusNode =   FocusNode();
 FocusNode subjectFocusNode = FocusNode();
 FocusNode messageFocusNode =   FocusNode();
 getFocusNode(context) {
   switch (contactUsEmailFocusNode) {
     case ContactUsEmailFocusNode.email:
       FocusScope.of(context).requestFocus(emailFocusNode);
       break;
     case ContactUsEmailFocusNode.subject:
       FocusScope.of(context).requestFocus(subjectFocusNode);
       break;
     case ContactUsEmailFocusNode.message:
       FocusScope.of(context).requestFocus(messageFocusNode);
       break;
     case ContactUsEmailFocusNode.success:
     case null:
       FocusScope.of(context).unfocus();
       break;
   }
 }

 setFocus(focus, context) {
   contactUsEmailFocusNode = focus;
   getFocusNode(context);
   update();
 }
 bool emailIsValid(String email) {
   return GetUtils.isEmail(email);
 }
 send(context) async {
   if(emailController.text.isEmpty ){
     GetMessageError(context, 'please enter email');
     setFocus(ContactUsEmailFocusNode.email, context);
   }else if(!emailIsValid(emailController.text)){
     GetMessageError(context, 'please enter valid email');
     setFocus(ContactUsEmailFocusNode.email, context);
   }else if(subjectController.text.isEmpty){
     GetMessageError(context, 'please enter subject');
     setFocus(ContactUsEmailFocusNode.subject, context);
   }else if(messageController.text.isEmpty){
     GetMessageError(context, 'please enter message');
     setFocus(ContactUsEmailFocusNode.message, context);
   }else{
     print('emailController.text :${emailController.text}');
     print('subjectController.text :${subjectController.text}');
     print('messageController.text :${messageController.text}');
     GetMessageConfirm(context, 'Success');
     update();
    }
 }

}

enum ContactUsEmailFocusNode {
  email,
  subject,
  message,
  success
}
