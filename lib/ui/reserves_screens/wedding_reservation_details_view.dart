import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/reserves_screens/terms_reservation_view.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:studio/widgets/clippath.dart';
import 'package:studio/widgets/custom_button.dart';

class WeddingReservationDetailsView extends StatefulWidget {
  final String type;
  final String details;
  final List<String> servicesList;
  final List<String> detailsList;
  final double price;
  WeddingReservationDetailsView({
    Key? key,
    required this.servicesList,
    required this.detailsList,
    required this.price,
    required this.type,
    required this.details,
  }) : super(key: key);
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<WeddingReservationDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: FCISize.width(context),
                  height: FCISize.height(context) * 0.3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/hands.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                ClipPath(
                  child: Container(
                    width: FCISize.width(context),
                    height: FCISize.height(context),
                    color: Colors.white,
                  ),
                  clipper: CustomClipTop(),
                ),
                Padding(
                  padding: FCIPadding.symmetric(width: 10, height: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: FCISize.height(context) * 0.2,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: FCIColors.textColor(),
                              size: ScreenUtil().setSp(20),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(40),
                        ),
                        if (widget.detailsList.isNotEmpty)
                          Text(
                            "${widget.type}",
                            style: FCITextStyle.normal(16,
                                color: FCIColors.buttonColor2()),
                          ),
                        SizedBox(
                          height: ScreenUtil().setHeight(5),
                        ),
                        Text(
                          "${widget.details}",
                          style: FCITextStyle.bold(16, color: Colors.black),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        if (widget.detailsList.isNotEmpty)
                          ...List.generate(
                            widget.detailsList.length,
                            (index) => Container(
                              padding: FCIPadding.symmetric(height: 10),
                              child: Text('- ${widget.servicesList[index]}'),
                            ),
                          ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        if (widget.servicesList.isNotEmpty)
                          Text(
                            "الخدمات",
                            style: FCITextStyle.normal(16,
                                color: FCIColors.buttonColor2()),
                          ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        if (widget.servicesList.isNotEmpty)
                          GridView.count(
                            crossAxisCount: 2,
                            physics: BouncingScrollPhysics(),
                            childAspectRatio: 6,
                            shrinkWrap: true,
                            children: List.generate(
                              widget.servicesList.length,
                              (index) => Container(
                                padding: FCIPadding.symmetric(height: 5),
                                child: Text('- ${widget.servicesList[index]}'),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Container(
                          width: FCISize.width(context),
                          alignment: Alignment.center,
                          child: Text(
                            "المبلغ : ${widget.price.toString()}",
                            style: FCITextStyle.normal(16,
                                color: FCIColors.buttonColor2()),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
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
                                  text: 'حجز',
                                ),
                              ],
                            ))
                      ]),
                ),
              ],
            ),
          )),
    );
  }
}
