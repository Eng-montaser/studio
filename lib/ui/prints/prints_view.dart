import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studio/logic/controllers/prints/album_controller.dart';
import 'package:studio/logic/controllers/prints/carList_controller.dart';
import 'package:studio/ui/prints/add_car_view.dart';
import 'package:studio/widgets/custom_page_loading.dart';


import '../../utils/FCIStyle.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);

  @override
  _MyCarsScreenState createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(

      child: GetBuilder<CarListController>(
        init: CarListController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('سياراتي',
                  textScaleFactor: 1.5,style: FCITextStyle.bold(18,color: Colors.white),),
              elevation: 0,
              centerTitle: true,
              toolbarHeight: ScreenUtil().setHeight(100),
              actions: [ GestureDetector(
                onTap: ()async{
                bool? insert=await Get.to(()=>AddCarView());

                      if(insert != null && insert){
                     controller.getCars();
                }
                },
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(10),
                    ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,),
                    shape: BoxShape.circle
                  ),
                    child: Icon(Icons.add_sharp,color: Colors.white,
                    size: 30,)),
              )],
              backgroundColor: FCIColors.primaryColor(),
            ),
            body: PageLoading(
              loading: controller.isLoading.value,
              child: Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: size.width,
                        height: ScreenUtil().setHeight(100),
                        decoration: BoxDecoration(
                          color: FCIColors.primaryColor(),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))
                        ),

                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setHeight(0),
                      child: Container(
                        width: size.width,
                        height: ScreenUtil().setHeight(100),

                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(120),
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.low,
                          //  color: Colors.transparent,
                          // colorBlendMode: BlendMode.colorBurn,
                          fit: BoxFit.contain,
                          //     fit: BoxFit.cover),
                        )

                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          ),
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(controller.carList.length, (index) => Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(40),
                              vertical: ScreenUtil().setHeight(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15),

                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${controller.carList[index].Vendor_name}',
                                        style: FCITextStyle.bold(18),
                                      ),
                                      Image.memory(base64Decode('${controller.carList[index].Vendors_binary_image}'),
                                      width: ScreenUtil().setWidth(100),
                                     // fit: BoxFit.cover,
                                      height: ScreenUtil().setHeight(80),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.grey
                                      )
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      // horizontal: ScreenUtil().setWidth(50),
                                      horizontal: ScreenUtil().setHeight(20),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                     // horizontal: ScreenUtil().setWidth(50),
                                      vertical: ScreenUtil().setHeight(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/images/sward.jpg',
                                        width: ScreenUtil().setWidth(50),
                                        height: ScreenUtil().setHeight(50),
                                        ),
                                        SizedBox(width: ScreenUtil().setWidth(15),),
                                        Text('${controller.carList[index].Board_No}',style: FCITextStyle.bold(16),)
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          controller.deleteCar(context, controller.carList[index]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            'حذف',
                                            style: FCITextStyle.bold(18,color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: ()async{
                                      bool updat= await   Get.to(()=>AddCarView(carModelData:controller.carList[index] ,));

                                          if(updat != null && updat){
                                            controller.getCars();
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: ScreenUtil().setWidth(50),
                                            vertical: ScreenUtil().setHeight(10),
                                          ),
                                          decoration: BoxDecoration(
                                            color: FCIColors.primaryColor(),
                                            borderRadius: BorderRadius.circular(20)

                                          ),

                                          child: Text(
                                            'تعديل',
                                            style: FCITextStyle.bold(18,color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(15),)
                                ],
                              ),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
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
