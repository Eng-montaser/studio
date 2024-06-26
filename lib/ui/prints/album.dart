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
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .9),
                    itemBuilder: (context, index) {
                      return Card(
                       // margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.asset(
                                  '${controller.paperDataList[index].image!}',
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.low,
                                  alignment: Alignment.centerRight,
                                  // width: ScreenUtil().setWidth(150),
                                  // height: ScreenUtil().setHeight(100),
                                ),
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
                                    style: FCITextStyle.bold(16),
                                  ),
                                  Text(
                                    '${controller.paperDataList[index].price!} ${'RS'.tr}',
                                    style: FCITextStyle.bold(16),
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
