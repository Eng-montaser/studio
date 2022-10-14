import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_button.dart';
import 'package:studio/widgets/custom_textfeild.dart';

import '../../../logic/controllers/contact_us.dart';


class BirthReservationView extends StatefulWidget {
  const BirthReservationView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}
List<String> data=[
  'توثق اول لحظات طفلك من الحمل الى مابعد الولادة',
   '- ثلاث جلسات تصوير',
       '- البوم AS',
       '- فلاش ميمورى'
];
class _ContactUsState extends State<BirthReservationView> {
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
                  "مواليد",
                  style: FCITextStyle.bold(18, color:  FCIColors.textColor()),
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
      body:  GetBuilder<ContactUsController>(
          init: ContactUsController(),
          builder: (controller) {
            return  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: FCISize.width(context),
                        height: FCISize.height(context)*0.25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/wedding_home3.jpg'),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        width: FCISize.width(context),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: FCISize.width(context)*0.9,
                              // height: FCISize.height(context)*0.225,
                              padding: FCIPadding.symmetric(width: 10,
                                  height: 20),
                              decoration:  BoxDecoration(
                                color: Colors.white,
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
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                      children: List.generate(data.length, (index) =>
                                          Container(
                                            padding: FCIPadding.symmetric(width: 5,height: 5),
                                            child: Text(data[index],
                                              style: FCITextStyle.normal(16),),
                                          ),
                                      ),
                                  ),
                                  Text(
                                    "الخدمات",
                                    style: FCITextStyle.normal(16, color:  FCIColors.buttonColor2()),
                                  ),
                                  ...List.generate(4, (index) =>
                                      Container(
                                        padding: FCIPadding.symmetric(height: 10),
                                        child: Text('-ثلاث ثيمثات باختبارك'),
                                      ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                  Container(
                                    width: FCISize.width(context),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "8000",
                                      style: FCITextStyle.bold(16, color:  FCIColors.buttonColor2()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                  Container(
                                      width: FCISize.width(context),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            onTap: (){
                                              Get.back();
                                            },
                                            text: 'حجز',
                                          )],
                                      )
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                ],
                              )
                            ),



                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(120),
                        height: ScreenUtil().setHeight(35),
                        padding: FCIPadding.symmetric(width: 10),
                        margin:  FCIPadding.symmetric(width: 40),
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
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
                        child: Text('البوم',
                          style:FCITextStyle.normal(14,color: Colors.white),),
                      )
                    ],
                  ),

                ]
            );
        }
      ),
    );
  }
}
