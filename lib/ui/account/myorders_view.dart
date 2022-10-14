import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/account/orders_controller.dart';
import 'package:studio/models/order.dart';

import '../../utils/FCIStyle.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
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
                  "Myorders".tr,
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
                  //   horizontal: ScreenUtil().setWidth(15),
                  vertical: ScreenUtil().setHeight(20)),
              width: FCISize.width(context),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: TabBar(
                        indicatorColor: FCIColors.accentColor(),
                        unselectedLabelColor: FCIColors.blackaccenttColor(),
                        labelStyle: FCITextStyle.bold(18),
                        indicatorWeight: .1,
                        indicatorSize: TabBarIndicatorSize.label,
                        automaticIndicatorColorAdjustment: true,
                        unselectedLabelStyle: FCITextStyle.normal(18),
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'CurrentOrders'.tr,
                          ),
                          Tab(
                            text: 'PrevOrders'.tr,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          orderWidget(controller.currentOrder),
                          orderWidget(controller.prevOrder),
                        ],
                      ),
                    )
                  ],
                  //Tab
                ),
              ),
            );
          }),
    );
  }

  Widget orderWidget(List<OrderData> orderdata) {
    return Container(
        child: ListView.builder(
            itemCount: orderdata.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(15),
                    vertical: ScreenUtil().setHeight(10)),
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(15),
                      vertical: ScreenUtil().setHeight(5)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(orderdata[index].image!,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(100)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setHeight(0)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Text('${orderdata[index].name}',
                                style: FCITextStyle.normal(14)),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Text('${orderdata[index].size}',
                                style: FCITextStyle.normal(14)),
                            Expanded(child: SizedBox()),
                            Text(
                              '${orderdata[index].price} ${'RS'.tr}',
                              style: FCITextStyle.normal(14,
                                  color: FCIColors.redaccenttColor()),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
