import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_button.dart';
import 'package:studio/widgets/custom_textfeild.dart';

import '../../../logic/controllers/contact_us.dart';
import '../../../widgets/images_carousel.dart';

class ConfirmReservationView extends StatefulWidget {
  const ConfirmReservationView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ConfirmReservationView> {
  final List<String> imgList = [
    'assets/images/wedding_home1.jpg',
    'assets/images/02.jpeg',
    'assets/images/wedding_home3.jpg',
    'assets/images/wedding_home4.jpg',
    'assets/images/wedding_home5.jpg',
  ];
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
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: FCISize.width(context),
                        height: FCISize.height(context) * 0.2,
                        child: ImagesCarousel2(networkImages: imgList)),
                    Padding(
                      padding: FCIPadding.symmetric(width: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                FCIPadding.symmetric(height: 10, width: 10),
                            child: Text(
                              "التاريخ",
                              style: FCITextStyle.normal(16),
                            ),
                          ),
                          Container(
                            padding: FCIPadding.symmetric(height: 5, width: 10),
                            child: Text(
                              "المدينة",
                              style: FCITextStyle.normal(16),
                            ),
                          ),
                          CustomTextField2(
                              hintText: 'المدينة',
                              width: FCISize.width(context) * 0.5,
                              height: ScreenUtil().setHeight(40),
                              onTap: () {},
                              onEditingComplete: () {}),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Container(
                            padding: FCIPadding.symmetric(height: 5, width: 10),
                            child: Text(
                              "اسم القاعة",
                              style: FCITextStyle.normal(16),
                            ),
                          ),
                          CustomTextField2(
                              hintText: "الاسم",
                              width: FCISize.width(context) * 0.5,
                              height: ScreenUtil().setHeight(40),
                              onTap: () {},
                              onEditingComplete: () {}),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Container(
                            padding: FCIPadding.symmetric(height: 5, width: 10),
                            child: Text(
                              "ملاحظة:",
                              style: FCITextStyle.normal(16,
                                  color: FCIColors.buttonColor2()),
                            ),
                          ),
                          Container(
                            padding:
                                FCIPadding.symmetric(height: 10, width: 10),
                            child: Text(
                              "تضاف للمناطق خارج الاحساء رسوم النقل",
                              style: FCITextStyle.normal(16),
                            ),
                          ),
                          Container(
                              width: FCISize.width(context),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButton(
                                    onTap: () {
                                      Get.to(() => ConfirmReservationView());
                                    },
                                    text: 'حجز',
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
            );
          }),
    );
  }
}
