import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/ui/prints/album.dart';
import 'package:studio/ui/prints/layers.dart';
import 'package:studio/ui/prints/papers.dart';
import 'package:studio/widgets/custom_background.dart';

import '../../utils/FCIStyle.dart';

class PrintsScreen extends StatefulWidget {
  const PrintsScreen({Key? key}) : super(key: key);

  @override
  _PrintsScreenState createState() => _PrintsScreenState();
}

class _PrintsScreenState extends State<PrintsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return HomeBackground(
      image: 'assets/images/back.jpg',
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => LayersScreen());
              },
              child: menuRow('assets/images/canab.jpeg', 'Layers'.tr)),
          GestureDetector(
              onTap: () {
                Get.to(() => AlbumsScreen());
              },
              child: menuRow('assets/images/book.jpeg', 'Albums'.tr)),
          GestureDetector(
              onTap: () {
                Get.to(() => PapersScreen());
              },
              child: menuRow('assets/images/pictures.jpeg', 'Papers'.tr)),
        ],
      ),
    );
  }

  Widget menuRow(String image, String label) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(40),
          vertical: ScreenUtil().setHeight(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: [
            /*Image.asset(
              image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: ScreenUtil().setHeight(150),
              alignment: Alignment.topCenter,
            ),*/
            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(150),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image),
                      alignment: Alignment.center,

                      fit: BoxFit.cover)),
              ),

            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(250, 0, 0, 0),
                      Color.fromARGB(150, 0, 0, 0),
                      Color.fromARGB(100, 0, 0, 0),
                      Color.fromARGB(50, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                // alignment: Alignment.b,
                padding: EdgeInsets.all(
                  15.0,
                ),
                child: Text(
                  label,
                  style: FCITextStyle.bold(16, color: FCIColors.whiteColor()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
