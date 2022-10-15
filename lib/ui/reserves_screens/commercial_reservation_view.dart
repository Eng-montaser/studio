
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/custom_button.dart';
import 'package:studio/widgets/custom_textfeild.dart';

import '../../../logic/controllers/contact_us.dart';


class CommercialReservationView extends StatefulWidget {
  const CommercialReservationView({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<CommercialReservationView> {
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
                  "تجارى",
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
            return  SingleChildScrollView(
              child: Column(
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
                                  image: AssetImage('assets/images/wedding_home4.jpg'),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customImageButton('موديل','assets/images/wedding_home1.jpg',(){     }),
                                customImageButton('سينمائى','assets/images/wedding_home6.png',(){   }),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(15),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding:FCIPadding.symmetric(height: 10,width: 10),
                              child: Text(
                                "تواصل معنا تواصل معنا تواصل معنا تواصل معنا تواصل معنا تواصل معنا تواصل معنا تواصل معنا تواصل معنا",
                                style: FCITextStyle.normal(16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                    ),

                  ]
              ),
            );
        }
      ),
    );
  }
  customImageButton(text,image,ontap){
    return   InkWell(
      onTap: (){
        ontap();
      },
      child: Container(
          child:  Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: FCISize.width(context)*0.31,
                width: FCISize.width(context)*0.31,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage(image),
                      fit: BoxFit.cover
                  ),
                  borderRadius:const BorderRadius.all(Radius.circular(15.0),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,//Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                width: FCISize.width(context)*0.31,
                child: Text(
                  text,
                  style: FCITextStyle.normal(16,
                      color: FCIColors.whiteColor()),
                ),
              ),
            ],
          )
      ),
    );
  }
}
