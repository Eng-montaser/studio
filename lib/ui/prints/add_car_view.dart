import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:studio/logic/controllers/prints/add_car_controller.dart';
import 'package:studio/models/car_data.dart';
import 'package:studio/utils/FCIStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studio/widgets/circle_image.dart';
import 'package:studio/widgets/custom_page_loading.dart';
import 'package:studio/widgets/custom_search_list.dart';

class AddCarView extends StatefulWidget {
  final CarInfo? carModelData;

  AddCarView({Key? key, this.carModelData}) : super(key: key);
  @override
  _AddCarViewState createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
        init: AddCarController(carInfoData: widget.carModelData),
        builder: (controller) {
          return Scaffold(
              // resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Color(0xffFAFAFA),
                elevation: 0,
                actions: [
                  Image.asset(
                    'assets/images/house.png',
                    width: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: Text(
                  widget.carModelData != null ? 'تعديل سارة' : 'إضافة سيارة',
                  textScaleFactor: 1.5,
                  style: FCITextStyle.bold(16, color: FCIColors.primaryColor()),
                ),
                centerTitle: true,
              ),
              body: PageLoading(
                loading: controller.isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            // GestureDetector(
                            //   onTap: () {
                            //     AwesomeDialog(
                            //             context: context,
                            //             animType: AnimType.LEFTSLIDE,
                            //             headerAnimationLoop: false,
                            //             dialogType: DialogType.INFO,
                            //             dismissOnBackKeyPress: true,
                            //             dismissOnTouchOutside: true,
                            //             customHeader: Container(
                            //               height: ScreenUtil().setWidth(100),
                            //               width: ScreenUtil().setHeight(100),
                            //               decoration: BoxDecoration(
                            //                   shape: BoxShape.circle,
                            //                   image: DecorationImage(
                            //                       image: AssetImage(
                            //                     'assets/images/logo.png',
                            //                   ))),
                            //             ),
                            //             title: 'Upload Photo'.tr,
                            //             body: Text(
                            //               'Upload image from:',
                            //               style: FCITextStyle.normal(18),
                            //             ),
                            //             btnCancelText: "Gallery",
                            //             btnCancelColor:
                            //                 FCIColors.primaryColor(),
                            //             btnCancelOnPress: () {
                            //               controller
                            //                   .pickImage(ImageSource.gallery);
                            //             },
                            //             btnOkText: "Capture Photo".tr,
                            //             btnOkColor: Colors.blue,
                            //             btnOkOnPress: () async {
                            //               controller
                            //                   .pickImage(ImageSource.camera);
                            //             },
                            //             onDissmissCallback: (type) {})
                            //         .show();
                            //   },
                            //   child: Stack(
                            //     children: [
                            //       Container(
                            //         width: ScreenUtil().setWidth(100),
                            //         height: ScreenUtil().setWidth(100),
                            //         decoration: BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           border: Border.all(
                            //               width: 3, color: Colors.white),
                            //         ),
                            //         child: defaultImage(
                            //           100,
                            //           controller.carModelData != null
                            //               ? controller.carModelData!.image ?? ''
                            //               : '',
                            //           controller.imagePath ?? '',
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: FCIPadding.only(
                            //             left: ScreenUtil().setWidth(55),
                            //             top: ScreenUtil().setHeight(95),
                            //             right: ScreenUtil().setWidth(10),
                            //             bottom: ScreenUtil().setHeight(5)),
                            //         child: Icon(
                            //           Icons.camera_enhance_rounded,
                            //           color: FCIColors.grey1(),
                            //           size: 30,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.makesItems,
                                  label: 'إختر نوع السيارة*',
                                  initialIndex: controller.selectMarkIndex,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.makesItems.map((item) {
                                    return item.title_ar;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.changeCarMake(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.allModelItems,
                                  label: 'إختر موديل السيارة*',
                                  initialIndex: controller.selectModelIndex,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.allModelItems.map((item) {
                                    return item.title_ar;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.changeCarModel(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.cylinderItems,
                                  label: 'إختر اسطوانات السيارة*',
                                  initialIndex: controller.selectCylinderIndex,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.cylinderItems.map((item) {
                                    return item.name;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.changeCylinder(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Card(
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.fuelItems,
                                  label: 'الوقود*',
                                  initialIndex: controller.selectFuelIndex,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.fuelItems.map((item) {
                                    return item.title_ar;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      // print(value.title);
                                      controller.changeCarFuel(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(12)),
                                  width: FCISize.width(context) * 0.75,
                                  child: Text(
                                    'معلومات تسجيل السيارة'.tr,
                                    style: FCITextStyle.bold(18,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: customTextField(
                                controller: controller.vinController,
                                focusNode: controller.focusNodeVin,
                                onTap: () {
                                  controller.setFocus(
                                      AddCarFocusNode.vin, context);
                                },
                                onEditingComplete: () {
                                  controller.setFocus(
                                      AddCarFocusNode.serialNumber, context);
                                },
                                inputType: TextInputType.text,
                                hintText: "الرقم التسلسلى",
                                prefixIcon: Icons.lock,
                              ),
                            ),
                           // SizedBox(height: ScreenUtil().setHeight(10)),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: customTextField(
                                controller: controller.serialNumberController,
                                focusNode: controller.focusNodeSerial,
                                // filled:  controller.loginFocusNode == LoginFocusNode.email,
                                onTap: () {
                                  controller.setFocus(
                                      AddCarFocusNode.serialNumber, context);
                                },

                                onEditingComplete: () {
                                  controller.setFocus(
                                      AddCarFocusNode.mileage, context);
                                },
                                inputType: TextInputType.text,

                                hintText: "أرقام لوحة السيارة",

                                prefixIcon: Icons.email,
                              ),
                            ),
                        //    SizedBox(height: ScreenUtil().setHeight(10)),
                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: customTextField(
                                controller: controller.mileageController,
                                focusNode: controller.focusNodeMileage,
                                // filled:  controller.loginFocusNode == LoginFocusNode.email,
                                onTap: () {
                                  controller.setFocus(
                                      AddCarFocusNode.mileage, context);
                                },

                                onEditingComplete: () {
                                  controller.setFocus(
                                      AddCarFocusNode.success, context);
                                },
                                inputType: TextInputType.text,

                                hintText: "عدد الكيلومترات",

                                prefixIcon: Icons.email,
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(12)),
                                  width: FCISize.width(context) * 0.75,
                                  child: Text(
                                    'معلومات إضافية'.tr,
                                    style: FCITextStyle.bold(18,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.colorItems,
                                  label: 'اللون',
                                  initialIndex: controller.selectColorIndex,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.colorItems.map((item) {
                                    return item.title_ar;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.changeCarColor(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),

                            Padding(
                              padding: FCIPadding.symmetric(width: 15),
                              child: Container(
                                color: Colors.white,
                                width: FCISize.width(context) * 0.75,
                                child: CustomSearchableDropDown(
                                  items: controller.yearItems,
                                  label: 'سنة الصنع',
                                  initialIndex: controller.selectYear != null
                                      ? controller.selectYearIndex
                                      : null,
                                  dropdownItemStyle: FCITextStyle.normal(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 2,
                                          color: FCIColors.grey1()
                                              .withOpacity(.3))),
                                  labelStyle: FCITextStyle.bold(14),
                                  dropDownMenuItems:
                                      controller.yearItems.map((item) {
                                    return item;
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.changeCarYear(value);
                                    } else {}
                                  },
                                ),
                              ),
                            ),
                            //  SizedBox(height: ScreenUtil().setHeight(10)),

                            SizedBox(height: ScreenUtil().setHeight(30)),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {

                              controller.createCar(context);

                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(15)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: FCIColors.primaryColor()),
                            width: ScreenUtil().setWidth(386),
                            height: ScreenUtil().setHeight(48),
                            child: Text(
                              'Confirm'.tr,
                              style:
                                  FCITextStyle.normal(15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  customTextField({
    controller,
    focusNode,
    onTap,
    onEditingComplete,
    inputType,
    hintText,
    prefixIcon,
  }) {
    return Container(
      margin: FCIPadding.symmetric(height: 5),
      child: Container(
        width: FCISize.width(context) * 0.75,
        padding: FCIPadding.symmetric(width: 3, height: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            border:
                Border.all(width: 2, color: FCIColors.grey1().withOpacity(.3))),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTap: () {
            onTap!();
          },
          onEditingComplete: () {
            onEditingComplete!();
          },
          validator: (v) {},
          onSaved: (v) {},
          keyboardType: inputType,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: FCITextStyle.bold(14, color: Colors.grey),
            // prefixIcon:   prefixIcon!=null?Icon(prefixIcon,size: ScreenUtil().setHeight(30),color: Colors.grey,):null,
          ),
          style: FCITextStyle.bold(14, color: Colors.black),
        ),
      ),
    );
  }
}
