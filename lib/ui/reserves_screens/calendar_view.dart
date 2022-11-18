import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/account/orders_controller.dart';
import 'package:studio/models/order.dart';
import 'package:studio/widgets/custom_button.dart';
import 'package:studio/widgets/images_carousel.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/FCIStyle.dart';
import 'terms_reservation_view.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<String> imgList = [
    'assets/images/widding_header.png',
    'assets/images/coffe.jpg',
    'assets/images/hat.jpeg',
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: ScreenUtil().setSp(25),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "Wedding".tr,
                  style: FCITextStyle.bold(22),
                ),
              ],
            );
          }),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<OrdersController>(
          init: OrdersController(),
          builder: (controller) {
            return Container(
              margin: EdgeInsets.symmetric(
                     horizontal: ScreenUtil().setWidth(15),
                  vertical: ScreenUtil().setHeight(20)),
              width: FCISize.width(context),
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesCarousel2(
                      networkImages: imgList,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "Date".tr,
                        style: FCITextStyle.bold(20),
                      ),
                    ),
                    //SizedBox(height: ScreenUtil().setHeight(10),),
                    calendarWidget(),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "Time".tr,
                        style: FCITextStyle.bold(20),
                      ),

                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "From".tr,
                              style: FCITextStyle.normal(18,color: FCIColors.buttonColor2()),
                            ) ,
                            OutlinedButton(
                              onPressed: (){

                              },

                              child: Row(
                                children: [
                                  Text(
                                    "10:00",
                                    style: FCITextStyle.normal(18),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                              style: ButtonStyle(


                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "To".tr,
                              style: FCITextStyle.normal(18,color: FCIColors.buttonColor2()),
                            ) ,
                            OutlinedButton(
                              onPressed: (){

                              },

                              child: Row(
                                children: [
                                  Text(
                                    "10:00",
                                    style: FCITextStyle.normal(18),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                              style: ButtonStyle(


                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "City".tr,
                        style: FCITextStyle.bold(20),
                      ),

                    ),
                    Container(
                      width: ScreenUtil().setWidth(200),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)
                        ),
                        child: TextFormField(
decoration: InputDecoration(
  border: InputBorder.none,
  hintText: 'City'.tr,
),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "Hall".tr,
                        style: FCITextStyle.bold(20),
                      ),

                    ),
                    Container(
                      width: ScreenUtil().setWidth(200),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name'.tr,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "Note".tr,
                        style: FCITextStyle.bold(20,color: FCIColors.buttonColor2()),
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(15)),
                      child: Text(
                        "NoteText".tr,
                        style: FCITextStyle.bold(20),
                      ),

                    ),
                    Container(
                        width: FCISize.width(context),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onTap: () {
                                Get.to(() => TermsReservationView());
                              },
                              text: 'Reserve'.tr,
                            ),
                          ],
                        ))
                    //showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget calendarWidget() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: TableCalendar(
          firstDay: DateTime.now(),
          daysOfWeekHeight: ScreenUtil().setHeight(35),
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: BoxDecoration(color: Color(0xffEBEBEB)),
            weekdayStyle: FCITextStyle.bold(18),
            weekendStyle: FCITextStyle.bold(18),
          ),

calendarStyle: CalendarStyle(
  tablePadding: EdgeInsets.zero,

//cellPadding: EdgeInsets.all(5),
cellMargin: EdgeInsets.zero,

  rowDecoration: BoxDecoration(
      color: FCIColors.calendarColor()
  ),
  todayDecoration: BoxDecoration(
    color: FCIColors.buttonColor2(),
    shape: BoxShape.circle
  )
),
          headerStyle: HeaderStyle(headerPadding: EdgeInsets.zero,
          leftChevronMargin: EdgeInsets.zero,
          rightChevronPadding: EdgeInsets.zero,
formatButtonVisible: false,
          titleCentered: true,
          rightChevronMargin: EdgeInsets.zero,
          leftChevronPadding: EdgeInsets.zero,
          headerMargin: EdgeInsets.zero),
          lastDay: DateTime.utc(2050, 3, 14),

          focusedDay: DateTime.now(),
        ));
  }
}
