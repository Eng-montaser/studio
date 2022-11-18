import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

class _HomeScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return HomeBackground(
      image: 'assets/images/accountBack.jpg',
      showLogo: false,
      child: Container(),
      positionedchild: Positioned(
        top: ScreenUtil().setHeight(120),
        right: 0,
        left: 0,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/albn.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'البن محمد',
                style: FCITextStyle.normal(16),
              ),
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
            menuRow('assets/images/share.png', 'ShareApp'.tr),
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
