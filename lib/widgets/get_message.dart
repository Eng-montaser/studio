import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../utils/FCIStyle.dart';

GetMessages( title, message,{color}){

  Fluttertoast.showToast(
      msg:  '${message}',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: FCIColors.primaryColor(),
      textColor: Colors.white,
      fontSize: 16.0
  );

  // Get.snackbar('','',
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.white,
  //     titleText: Text(
  //       '${title}',
  //       style: FCITextStyle.bold(15,
  //           color: color??FCIColors.primaryColor()),
  //     ),
  //     messageText: Text(
  //       '${message}',
  //       style: FCITextStyle.bold(15,
  //           color: color??FCIColors.primaryColor()),
  //     ));
}


GetMessageConfirm(context,   message,{color}){
  FToast FCIToast = FToast();
  FCIToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle,color: Colors.white,size: 25,),
        const SizedBox(
          width: 12.0,
        ),
        Text(message,style: FCITextStyle.normal(18,color: Colors.white),),
      ],
    ),
  );


  FCIToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 2),
  );
  // Custom Toast Position
  // FCIToast.showToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 2),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 16.0,
  //         left: 16.0,
  //       );
  //     });
}

GetMessageError(context, message,{color}){
  FToast FCIToast = FToast();
  FCIToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
    ),
    child: Text(message,style: FCITextStyle.normal(18,color: Colors.white),),
  );
  FCIToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 2),
  );
  // Custom Toast Position
  // FCIToast.showToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 2),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 16.0,
  //         left: 16.0,
  //       );
  //     });
}

GetMessageDelete(context, {message,color,onTap,onCancel}){
  AwesomeDialog(
      context: context,
      animType:
      AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      dismissOnBackKeyPress: true,
      dismissOnTouchOutside: true,
      customHeader: Container(
        height: ScreenUtil()
            .setWidth(100),
        width: ScreenUtil()
            .setWidth(100),
        decoration: BoxDecoration(
            shape:
            BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/yosre.png',
                ))),
      ),
      // title: 'Delete Employee',
      body: Text(message!=null?message:
      'Are you sure to delete'.tr,
        style:
        FCITextStyle.normal(
            18),
      ),
      btnCancelText: "No".tr,
      btnCancelColor: FCIColors
          .primaryColor(),
      btnCancelOnPress: () {},
      btnOkText: "Yes".tr,
      btnOkColor: Colors.red,
      btnOkOnPress: () async {
        onTap();
      },
      onDissmissCallback:
          (type) {
        onCancel();
      })
      .show();
}