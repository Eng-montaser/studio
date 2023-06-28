import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/reserves_screens/birth_reservation_view.dart';
import 'package:studio/ui/reserves_screens/commercial_reservation_view.dart';
import 'package:studio/ui/reserves_screens/model_reservation_view.dart';
import 'package:studio/ui/reserves_screens/movie_reservation_view.dart';
import 'package:studio/ui/reserves_screens/party_reservation_view.dart';
import 'package:studio/ui/reserves_screens/wedding_reservation_view.dart';
import 'package:studio/widgets/custom_background.dart';

import '../../../utils/FCIStyle.dart';

class ReservesScreen extends StatefulWidget {
  const ReservesScreen({Key? key}) : super(key: key);

  @override
  _ReservesScreenState createState() => _ReservesScreenState();
}

class _ReservesScreenState extends State<ReservesScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeBackground(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: ScreenUtil().setHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customImageButton('زفاف', 'assets/images/wedding_home5.jpg', () {
                Get.to(() => WeddingReservationView());
              }),
              customImageButton('حفلات', 'assets/images/albn.jpg', () {
                Get.to(() => PartyReservationView());
              }),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customImageButton('تجارى', 'assets/images/wedding_home4.jpg', () {
                Get.to(() => CommercialReservationView());
              }),
              customImageButton('مواليد', 'assets/images/wedding_home3.jpg',
                  () {
                Get.to(() => BirthReservationView());
              }),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customImageButton('موديل', 'assets/images/wedding_home1.jpg', () {
                Get.to(() => ModelReservationView());
              }),
              customImageButton('سينمائى', 'assets/images/wedding_home6.png',
                  () {
                Get.to(() => MovieReservationView());
              }),
            ],
          )
        ],
      ),
    );
  }

  customImageButton(text, image, ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: FCISize.width(context) * 0.31,
            width: FCISize.width(context) * 0.31,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black, //Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0)
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            width: FCISize.width(context) * 0.31,
            child: Text(
              text,
              style: FCITextStyle.normal(16, color: FCIColors.whiteColor()),
            ),
          ),
        ],
      )),
    );
  }
}
