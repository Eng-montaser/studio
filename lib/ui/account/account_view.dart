import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/system_controller.dart';
import 'package:studio/route/route.dart';
import 'package:studio/ui/account/myorders_view.dart';
import 'package:studio/ui/reserves_screens/calendar_view.dart';
import 'package:studio/ui/reserves_screens/terms_reservation_view.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_background.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
SystemController systemController = Get.find<SystemController>();
class _HomeScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return HomeBackground(

      showLogo: true,
      child: Container(),
      positionedchild: Positioned(
        top: ScreenUtil().setHeight(120),
        right: 0,
        left: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                //backgroundImage: AssetImage('assets/images/albn.jpg'),
                backgroundColor: FCIColors.avatarColor(),
                child: Text('${systemController.currentuser?.eng_name?.toUpperCase().substring(0,1)??'!'}',textScaleFactor: 2,style: FCITextStyle.bold(20,color: FCIColors.primaryColor()),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${systemController.currentuser?.name}',
                  style: FCITextStyle.bold(18),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'إعدادات الحساب',
                  style: FCITextStyle.bold(18,color: FCIColors.primaryColor()),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(50)
                ),
                elevation: 5,
                borderOnForeground: true,
                shadowColor: FCIColors.blackblueColor(),
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(50),
                  vertical: ScreenUtil().setHeight(15),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(35),
                    vertical: ScreenUtil().setHeight(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(30),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.center ,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(250),
                                child: Text(
                                  'عط هالكود اللى يعز عليك وراح تجيك مكافئتك بالمحفظة',
                                  style: FCITextStyle.bold(18),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20),),

                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                               strokeCap: StrokeCap.round,
                               color: Colors.grey,
                               dashPattern: [10,8],
                                strokeWidth: 2,
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(35),
                                  vertical: ScreenUtil().setHeight(10),
                                ),
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: ScreenUtil().setWidth(25),),
                                    Text(
                                      '${systemController.currentuser?.cash_back_coupon??'لا يوجد'}',
                                      style: FCITextStyle.bold(18,color: FCIColors.primaryColor()),
                                    ),
                                    SizedBox(width: ScreenUtil().setWidth(15),),
                                    Container(
                                      // width: ScreenUtil().setWidth(50),
                                      // height: ScreenUtil().setHeight(50),
                                      child: Icon(Icons.copy_rounded,
                                        size: 25,
                                        color: FCIColors.primaryColor(),),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 35,
                            color: FCIColors.primaryColor(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(25),
                      vertical: ScreenUtil().setHeight(8),
                    ),
                    child: Text(
                      'الحساب الشخصى',
                      style: FCITextStyle.bold(18,color: Colors.grey),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(()=>MyOrdersScreen());
                  },
                  child: menuRow('assets/images/order.png', 'Myorders'.tr)),
              GestureDetector(
                  onTap: () {
                    Get.to(()=>CalendarScreen());
                  },child: menuRow('assets/images/money-bag.png', 'Mypoints'.tr)),

              GestureDetector(
                onTap: () {
                  Get.to(()=>TermsReservationView());
                },
                child: menuRow(
                    'assets/images/terms-and-conditions.png', 'TermsConditions'.tr),
              ),
              menuRow('assets/images/settings.png', 'Setting'.tr),
              GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                  child: menuRow('assets/images/logout.png', 'Logout'.tr)),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuRow(String image, String title) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(10),
            horizontal: ScreenUtil().setWidth(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Image.asset(
              image,
              height: ScreenUtil().setWidth(35),
              width: ScreenUtil().setWidth(35),
              fit: BoxFit.contain,
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Text(title, style: FCITextStyle.normal(16))
          ]),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ]));
  }
}
