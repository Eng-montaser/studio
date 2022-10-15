import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/prints/album_controller.dart';

import '../../utils/FCIStyle.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
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
                  "Albums".tr,
                  style: FCITextStyle.bold(22),
                ),
              ],
            );
          }),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<AlbumController>(
          init: AlbumController(),
          builder: (controller) {
            return Container(
                margin: EdgeInsets.symmetric(
                    //   horizontal: ScreenUtil().setWidth(15),
                    vertical: ScreenUtil().setHeight(20)),
                width: FCISize.width(context),
                child: GridView.builder(
                    itemCount: controller.paperDataList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.5),
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.asset(
                                '${controller.paperDataList[index].image!}',
                                fit: BoxFit.fill,
                                alignment: Alignment.centerRight,
                                width: ScreenUtil().setWidth(150),
                                height: ScreenUtil().setHeight(100),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(25),
                                  vertical: ScreenUtil().setHeight(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${controller.paperDataList[index].size!}',
                                    style: FCITextStyle.normal(14),
                                  ),
                                  Text(
                                    '${controller.paperDataList[index].price!} ${'RS'.tr}',
                                    style: FCITextStyle.normal(14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }));
          }),
    );
  }
}
