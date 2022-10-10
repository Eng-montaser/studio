import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/home/main_controller.dart';

import '../../utils/FCIStyle.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: FCIColors.sidebarBackGroundColor(),
            body: IndexedStack(
              index: controller.selectedMenuItem,
              children: List.generate(controller.menuItems.length,
                  (index) => controller.menuItems[index].body),
            ),
            bottomNavigationBar: BottomAppBar(
                child: Container(
              decoration: BoxDecoration(
                  color: FCIColors.bottomBarColor(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  )),
              height: ScreenUtil().setHeight(75),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.menuItems.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.changeMenuItem(index);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // height: 300.0,
                          // width: 300,
                          child: Image.asset(
                            controller.menuItems[index].image,
                            width: ScreenUtil().setWidth(
                                controller.selectedMenuItem == index ? 30 : 25),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: FCISize.width(context) * 0.25,
                          child: Text(
                            '${controller.menuItems[index].label}',
                            style: controller.selectedMenuItem == index
                                ? FCITextStyle.bold(
                                    16,
                                  )
                                : FCITextStyle.normal(
                                    14,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }
}
