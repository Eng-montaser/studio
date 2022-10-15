import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/home/home_controller.dart';
import 'package:studio/models/print.dart';
import 'package:studio/widgets/custom_background.dart';
import 'package:studio/widgets/images_carousel.dart';

import '../../utils/FCIStyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return HomeBackground(
      image: 'assets/images/back.jpg',
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(20)),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: CupertinoSearchTextField(
                    placeholder: 'Search'.tr,
                    style: FCITextStyle.normal(18, height: 1.5),
                  ),
                ),
                carouse(),
                // categories(),
                frames(controller.printDataList, 'Prints'.tr),
                frames(controller.reserveDataList, 'Reserves'.tr),
              ],
            );
          }),
    );
  }

  Widget carouse() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              // alignment: Alignment.centerRight,
              //  color: Colors.red,
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(25)),
              child: Text(
                "LastUpdates".tr,
                style: FCITextStyle.normal(16),
              ),
            ),
          ],
        ),
        ImagesCarousel(networkImages: imgList)
      ],
    );
  }

  Widget categories() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // alignment: Alignment.centerRight,
              //  color: Colors.red,
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(25)),
              child: Text(
                "Categories".tr,
                style: FCITextStyle.normal(16),
              ),
            ),
            Container(
              // alignment: Alignment.centerRight,
              //  color: Colors.red,
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(25)),
              child: Text(
                "ShowAll".tr,
                style: FCITextStyle.normal(16, color: FCIColors.primaryColor()),
              ),
            ),
          ],
        ),
        Container(
          height: ScreenUtil().setHeight(70),
          child: ListView.builder(
              itemCount: 6,
              //  itemExtent: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.at_badge_plus),
                          ),
                        ),
                        Text(
                          "تصوير سينيمائى",
                          style: FCITextStyle.normal(
                            15,
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }

  Widget frames(List<PrintData> data, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // alignment: Alignment.centerRight,
              //  color: Colors.red,
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(25)),
              child: Text(
                label,
                style: FCITextStyle.normal(16),
              ),
            ),
            /*Container(
              // alignment: Alignment.centerRight,
              //  color: Colors.red,
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(25)),
              child: Text(
                "ShowAll".tr,
                style: FCITextStyle.bold(16, color: FCIColors.primaryColor()),
              ),
            ),*/
          ],
        ),
        Container(
          height: ScreenUtil().setWidth(120),
          margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
          child: ListView.builder(
              itemCount: data.length,
              //  itemExtent: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Stack(
                        children: [
                          Image.asset(
                            data[index].image!,
                            fit: BoxFit.cover,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(120),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(150, 0, 0, 0),
                                    Color.fromARGB(100, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Text(
                                data[index].size!,
                                style: FCITextStyle.bold(16,
                                    color: FCIColors.whiteColor()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}