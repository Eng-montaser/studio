import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/reserves_screens/wedding_reservation_details_view.dart';
import 'package:studio/utils/FCIStyle.dart';


import '../../../logic/controllers/contact_us.dart';


class WeddingReservationView extends StatefulWidget {
  const WeddingReservationView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<WeddingReservationView> {
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
                  "زفاف",
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
      backgroundColor: Colors.white,
      body:  GetBuilder<ContactUsController>(
          init: ContactUsController(),
          builder: (controller) {
            return  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  headerImage(),
                  circleImage('assets/images/woman.png'),
                  bodyData(),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: FCISize.width(context),
                        height: FCISize.height(context)*0.3,
                       ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: FCISize.width(context),
                          height: FCISize.height(context)*0.15,
                          decoration:  BoxDecoration(
                            color: FCIColors.backColor(),
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
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: FCISize.height(context)*0.075,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: FCISize.width(context)*0.8,
                              height: FCISize.height(context)*0.225,
                              padding: FCIPadding.symmetric(width: 10,
                              height: 15),
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
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(4, (index) =>
                                      Text('- 4 صور للمعالجة',
                                        style: FCITextStyle.normal(14),),
                                  ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('2000',style: FCITextStyle.normal(16,color:
                                     FCIColors.buttonColor2()),)
                                   ],
                                 )

                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(40),
                          child: Container(
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setHeight(35),
                        margin: FCIPadding.symmetric(width: 10),
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
                        child: Text('البكج التشويقى',
                          style:FCITextStyle.normal(14,color: Colors.white),),
                      )
                      )
                    ],
                  )
                   ]
              ),
            );
        }
      ),
    );
  }
  Widget customButton(ontap,text){
    return InkWell(
      onTap: (){
        ontap();
      },
      child: Container(
        width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(35),
        margin: FCIPadding.symmetric(width: 10),
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color:  Colors.white,
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
        child: Text(text,style:FCITextStyle.normal(14,color: FCIColors.textColor()),),
      ),
    );
  }
  Widget headerImage(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: FCISize.width(context),
          height: FCISize.height(context)*0.23,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/widding_header.png',),
                  fit: BoxFit.fill
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
    );
  }
  Widget circleImage(image){
    return Container(
      width: ScreenUtil().setWidth(50),
      height: ScreenUtil().setHeight(50),
      margin: FCIPadding.symmetric(height: 15),
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color:  Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
    );
  }
  Widget bodyData() {
    return Padding(
      padding: FCIPadding.symmetric(width: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text('تصوير فوتوغرافى',style:FCITextStyle.normal(14,color: FCIColors.buttonColor2()),),
              SizedBox(width: ScreenUtil().setWidth(10),),
              customButton(
                      (){
                    Get.to(()=>WeddingReservationDetailsView(
                      type: 'Full Day',
                      details: '',
                      detailsList: const[
                        'البوم',
                        '8 ساعات تصوير',
                        'لوحة خشب'
                      ],
                      servicesList: const[
                        'تصوير العريسين',
                        'تصوير العريسين وتفاصيله',
                        'تصوير العريسين',
                        'تصوير العريسين وتفاصيله',
                        'تصوير العريسين',
                        'تصوير العريسين وتفاصيله',
                        'تصوير العريسين',
                        'تصوير العريسين وتفاصيله',

                      ],
                      price: 8000,
                    ));
                  },
                  'Full Day'),
              customButton(    (){
                Get.to(()=>WeddingReservationDetailsView(
                  type: 'Full Day',
                  details: '',
                  detailsList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  servicesList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  price: 8000,
                ));
              },
                  'Half Day'),

            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            children: [
              Text('فيديو سينمائى',style:FCITextStyle.normal(14,color: FCIColors.buttonColor2()),),
              SizedBox(width: ScreenUtil().setWidth(10),),
              customButton(    (){
                Get.to(()=>WeddingReservationDetailsView(
                  type: 'Full Day',
                  details: '',
                  detailsList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  servicesList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  price: 8000,
                ));
              },
                  'Full Day'),
              customButton(    (){
                Get.to(()=>WeddingReservationDetailsView(
                  type: 'Half Day',
                  details: '',
                  detailsList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  servicesList: const[
                    'البوم',
                    '8 ساعات تصوير',
                    'لوحة خشب'
                  ],
                  price: 8000,
                ));
              },
                  'Half Day'),

            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          circleImage('assets/images/man.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تصوير فوتوغرافى و فيديو سينمائى',
                style:FCITextStyle.normal(14,color: FCIColors.buttonColor2()),),
              SizedBox(height: ScreenUtil().setHeight(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customButton(    (){
                    Get.to(()=>WeddingReservationDetailsView(
                      type: 'Full Day',
                      details: 'تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل ',
                      detailsList: const[
                        'البوم',
                        '8 ساعات تصوير',
                        'لوحة خشب'
                      ],
                      servicesList: const[
                        'البوم',
                        '8 ساعات تصوير',
                        'لوحة خشب'
                      ],
                      price: 8000,
                    ));
                  },
                      'Full Day'),
                  customButton(    (){
                    Get.to(()=>WeddingReservationDetailsView(
                      type: 'Half Day',
                      details: 'تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل تفاصيل ',
                      detailsList: const[
                        'البوم',
                        '8 ساعات تصوير',
                        'لوحة خشب'
                      ],
                      servicesList: const[
                        'البوم',
                        '8 ساعات تصوير',
                        'لوحة خشب'
                      ],
                      price: 8000,
                    ));
                  },
                      'Half Day'),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }

}
