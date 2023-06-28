import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studio/database/services/get_service.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/models/car_data.dart';
import 'package:studio/widgets/get_message.dart';

class AddCarController extends GetxController {
  GetService getService = new GetService();
  bool isLoading = false;
  CarInfo? carInfoData;
  AddCarController({this.carInfoData});
//  List<CarModel> carModelList = [];
  List<CarMake> makesItems = [];
  List<CarColor> colorItems = [];
  List<CarFuel> fuelItems = [];
  List<String> yearItems = [];
  List<CarModel> allModelItems = [];
  List<CarCylinder> cylinderItems = [];

  CarMake? selectMake;
  CarCylinder? selectCylinder;
  CarModel? selectModel;
  int? selectMarkIndex;
  int? selectModelIndex = 0;
  int? selectCylinderIndex = 0;
  int? selectColorIndex;
  int selectYearIndex = 0;
  int selectFuelIndex = 0;
  CarFuel? selectFuel;
  CarColor? selectColor;
  String? selectYear;
  TextEditingController vinController = new TextEditingController(text: '');
  TextEditingController mileageController = new TextEditingController(text: '');
  TextEditingController serialNumberController =
      new TextEditingController(text: '');
  AddCarFocusNode? addCarFocusNode;
  FocusNode focusNodeMileage = new FocusNode();
  FocusNode focusNodeVin = new FocusNode();
  FocusNode focusNodeSerial = new FocusNode();
  String? imagePath;
  // File? image;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    isLoading = true;
    update();
    await getMakers();
    await getFuels();
    await getColors();
    await getYears();
    if (carInfoData != null &&
        allModelItems.length > 0 &&
        makesItems.length > 0 &&
        colorItems.length > 0 &&
        yearItems.length > 0) {

      selectYear = carInfoData!.Model_Year ?? '';
      if (carInfoData!.Model_Year != null || carInfoData!.Model_Year!.isNotEmpty)
        selectYearIndex =
            yearItems.indexWhere((element) => element == carInfoData!.Model_Year);

      vinController = new TextEditingController(text: '${carInfoData!.Board_No}');
      mileageController =
          new TextEditingController(text: '${carInfoData!.Last_KMs_Usages}');
      serialNumberController =
          new TextEditingController(text: '${carInfoData!.Car_Lic_No}');
      // imagePath=carModelData?.image;
      update();
    }
    isLoading = false;
    update();
  }

  getFocusNode(context) {
    switch (addCarFocusNode) {
      case AddCarFocusNode.mileage:
        FocusScope.of(context).requestFocus(focusNodeMileage);
        break;
      case AddCarFocusNode.serialNumber:
        FocusScope.of(context).requestFocus(focusNodeSerial);
        break;
      case AddCarFocusNode.vin:
        FocusScope.of(context).requestFocus(focusNodeVin);
        break;
      case AddCarFocusNode.success:
      case null:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  setFocus(AddCarFocusNode focus, context) {
    addCarFocusNode = focus;
    getFocusNode(context);
    update();
  }

  // getCarModelList() {
  //   List<CarModel>? data;
  //   if (selectMake != null) {
  //     data = makesItems
  //         .firstWhereOrNull((make) => make.id == selectMake!.id)!
  //         .carModelItems;
  //   }
  //   allModelItems = data ?? [];
  //   update();
  // }

  changeCarMake(CarMake val) {
    selectMake = val;

    //selectModelIndex = 0;
    selectMarkIndex =
        makesItems.indexWhere((element) => element.id == selectMake!.id);
    update();

    getModes(val.id!);
    update();
  }

  changeCarModel(CarModel val) {
    selectModel = val;
    selectModelIndex =
        allModelItems.indexWhere((element) => element.id == selectModel!.id);
    update();
    getCylinder(val.id!);
    update();
  }changeCylinder(CarCylinder val) {
    selectCylinder = val;
    selectCylinderIndex =
        cylinderItems.indexWhere((element) => element.id == selectCylinder!.id);
    update();
  }

  changeCarFuel(CarFuel val) {
    selectFuel = val;
    selectFuelIndex =
        fuelItems.indexWhere((element) => element.id == selectFuel!.id);
    update();
  }

  changeCarColor(CarColor val) {
    selectColor = val;
    selectColorIndex =
        colorItems.indexWhere((element) => element.id == selectColor!.id);
    update();
  }

  changeCarYear(String val) {
    selectYear = val;
    selectYearIndex = yearItems.indexWhere((element) => element == val);
    update();
  }

  createCar(context) {
    if (selectMake == null) {
      GetMessageError(context, "Select Car Make");
    } else if (selectModel == null) {
      GetMessageError(context, "Select Car Model");
    }else if (selectFuel == null) {
      GetMessageError(context, "Select Car Fuel");
    } else if (selectColor == null) {
      GetMessageError(context, "Select Car Color");
    }
    else if (selectYear == null) {
      GetMessageError(context, "Select Car Year");
    } else if (vinController.text.isEmpty) {
      GetMessageError(context, "Select Car vin");
      setFocus(AddCarFocusNode.vin, context);
    } else if (serialNumberController.text.isEmpty) {
      GetMessageError(context, "Select Car Serial Number");
      setFocus(AddCarFocusNode.serialNumber, context);
    } else if (mileageController.text.isEmpty) {
      GetMessageError(context, "Select Car Mileage");
      setFocus(AddCarFocusNode.mileage, context);
    } else {
      var map = {
        "Car_Vendor_id": '${selectMake?.id}',
        "Car_Model_id": '${selectModel?.id}',
        "Car_Color_id": '${selectColor?.id}',
        "Model_Year": '${selectYear}',
        "Board_No": "${vinController.text}",
        "Car_Lic_No": "${serialNumberController.text}",
         "Last_KMs_Usages": "${mileageController.text}",
         "Car_Models_Engine_id": '${selectCylinder?.id}',
        "Car_Fule_Type_id": '${selectFuel?.id}'
      };
      try {
        isLoading = true;
        update();
       if(carInfoData != null){
         PostService()
             .updateCar(map ,{'id':'${carInfoData!.id!}'})
             .then((response) async {
           isLoading = false;
           update();
           if (response.statusCode == 200) {
             var data = jsonDecode(response.body);
             if (data['status']) {
               isLoading = false;
               update();

               GetMessageConfirm(context, "${data['message']}");
               Get.back(result: data['status']);

             } else {
               isLoading = false;
               update();
               AwesomeDialog(
                   context: context,
                   animType: AnimType.LEFTSLIDE,
                   headerAnimationLoop: false,
                   dialogType: DialogType.ERROR,
                   dismissOnBackKeyPress: true,
                   dismissOnTouchOutside: true,
                   title:
                   '${data['error'] != null ? data['error'] : 'Error'}')
                   .show();
             }
           }
         });
       }else{
         PostService()
             .addCar(map, )
             .then((response) async {
           isLoading = false;
           update();
           if (response.statusCode == 200) {
             var data = jsonDecode(response.body);
             if (data['status']) {
               isLoading = false;
               update();

               GetMessageConfirm(context, "${data['message']}");
               Get.back(result: data['status']);

             } else {
               isLoading = false;
               update();
               AwesomeDialog(
                   context: context,
                   animType: AnimType.LEFTSLIDE,
                   headerAnimationLoop: false,
                   dialogType: DialogType.ERROR,
                   dismissOnBackKeyPress: true,
                   dismissOnTouchOutside: true,
                   title:
                   '${data['error'] != null ? data['error'] : 'Error'}')
                   .show();
             }
           }
         });
       }
      } catch (e) {
        isLoading = false;
        print('e: $e');
        update();
      }
    }
  }



  pickImage(ImageSource imageSource) async {
    var image = await ImagePicker.platform.pickImage(source: imageSource);
    if (image != null) {
      //  imageData = await image.readAsBytes();
      imagePath = image.path;
    }
    update();
  }

  getMakers() async {
    try {
      await getService.getMakers().then((response) async {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              makesItems = [];
              if (data['Data'] != null) {
                makesItems = List.generate(data['Data'].length,
                    (index) => CarMake.fromJson(data['Data'][index]));
              }
              if(carInfoData ==null)
              changeCarMake(makesItems[0]);
              else{
                selectMarkIndex =
                    makesItems.indexWhere((element) => element.id == carInfoData!.Car_Vendor_id);
                if(selectMarkIndex! >= 0)
                selectMake=makesItems[selectMarkIndex!];
                getModes(carInfoData!.Car_Vendor_id!);
              }

              update();
            }
          }
        }
      });

      update();
    } catch (e) {
      print('error $e');
      update();
    }
  }

  getModes(int vendor_id) async {
    try {
      await getService.getModels(vendor_id).then((response) async {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              allModelItems = [];
              if (data['Data'] != null) {
                allModelItems = List.generate(data['Data'].length,
                    (index) => CarModel.fromJson(data['Data'][index]));
              }
              if(carInfoData ==null){
              changeCarModel(allModelItems[0]);
                //getCylinder(allModelItems[0].id!);
              }
              else{

              selectModelIndex =
                  allModelItems.indexWhere((element) => element.id == carInfoData!.Car_Model_id);
              if(selectModelIndex! >= 0)
                selectModel=allModelItems[selectModelIndex!];
              getCylinder(carInfoData!.Car_Model_id!);

              }
              update();
            }
          }
        }
      });

      update();
    } catch (e) {
      update();
    }
  }
getCylinder(int model_id) async {
    try {
      await getService.getCylinder(model_id).then((response) async {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              cylinderItems = [];
              if (data['Data'] != null) {
                cylinderItems = List.generate(data['Data'].length,
                    (index) => CarCylinder.fromJson(data['Data'][index]));
              }
              if(carInfoData == null)
              changeCylinder(cylinderItems[0]);
               else{

              selectCylinderIndex =
                  cylinderItems.indexWhere((element) => element.id == carInfoData!.Cylinder_id);
              if(selectCylinderIndex! >= 0)
                selectCylinder=cylinderItems[selectCylinderIndex!];


              }
              update();
            }
          }
        }
      });

      update();
    } catch (e) {
      print('culiner error $e');
      update();
    }
  }

  getColors() async {
    try {
      await getService.getColors().then((response) async {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              colorItems = [];
              if (data['Data'] != null) {
                colorItems = List.generate(data['Data'].length,
                    (index) => CarColor.fromJson(data['Data'][index]));
              }
              if(carInfoData == null)
               changeCarColor(colorItems[0]);
              else{

                selectColorIndex =
                    colorItems.indexWhere((element) => element.id == carInfoData!.Car_Color_id);
                if(selectColorIndex! >= 0)
                  selectColor=colorItems[selectColorIndex!];


              }
              update();
            }
          }
        }
      });

      update();
    } catch (e) {
      update();
    }
  }

  getFuels() async {
    try {
      await getService.getFuels().then((response) async {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              fuelItems = [];
              if (data['Data'] != null) {
                fuelItems = List.generate(data['Data'].length,
                    (index) => CarFuel.fromJson(data['Data'][index]));
              }
              if(carInfoData == null)
    changeCarFuel(fuelItems[0]);
              else{

                selectFuelIndex =
                    fuelItems.indexWhere((element) => element.id == carInfoData!.Car_Fule_Type_id);
                if(selectFuelIndex >= 0)
                  selectFuel=fuelItems[selectFuelIndex];


              }
              update();
            }
          }
        }
      });

      update();
    } catch (e) {
      update();
    }
  }

  getYears() {
    int currentYear = DateTime.now().year + 1;
    int startingYear = 1950;
    List.generate((currentYear - startingYear) + 1, (index) {
      yearItems.add('${currentYear - index}');
    });
    if(carInfoData == null)
    changeCarYear(yearItems[0]);
    else{

      selectYearIndex =
          yearItems.indexWhere((element) => element == carInfoData!.Model_Year);
      if(selectYearIndex >= 0)
        selectYear=yearItems[selectYearIndex];


    }
  }
}

enum AddCarFocusNode { vin, serialNumber, mileage, success }
