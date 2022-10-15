import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/reserves_screens/confirm_reservation_view.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_button.dart';

import '../../../logic/controllers/contact_us.dart';

class TermsReservationView extends StatefulWidget {
  const TermsReservationView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<TermsReservationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  "حجز",
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
      backgroundColor: Colors.white,
      body: GetBuilder<ContactUsController>(
          init: ContactUsController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(10)),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            width: FCISize.width(context) * 0.8,
                            height: FCISize.height(context) * 0.225,
                            padding:
                                FCIPadding.symmetric(width: 10, height: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                4,
                                (index) => Text(
                                  '- 4 صور للمعالجة',
                                  style: FCITextStyle.normal(14),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setHeight(35),
                      padding: FCIPadding.symmetric(width: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: FCIColors.buttonColor2(),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        'الشروط والاحكام',
                        style: FCITextStyle.normal(14, color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: FCISize.height(context) * 0.25,
                ),
                Container(
                    width: FCISize.width(context),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onTap: () {
                            Get.to(() => ConfirmReservationView());
                          },
                          text: 'تاكيد حجز',
                        ),
                        CustomButton(
                          onTap: () {
                            Get.back();
                          },
                          text: 'الغاء',
                        )
                      ],
                    ))
              ]),
            );
          }),
    );
  }
}
