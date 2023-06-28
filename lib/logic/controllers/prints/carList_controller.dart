import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:studio/database/services/get_service.dart';
import 'package:studio/database/services/post_service.dart';
import 'package:studio/models/car_data.dart';
import 'package:studio/models/print.dart';
import 'package:studio/widgets/get_message.dart';

class CarListController extends GetxController {
  GetService getService = new GetService();
  PostService postService = new PostService();

  var isLoading = false.obs;
  RxList<PrintData> paperDataList = <PrintData>[].obs;
  List<CarInfo> carList = [];
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async{
   await getCars();
  }
  getCars() async {
    try {
      await postService.getCars().then((response) async {

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status']) {
            if (data['Data'].length > 0) {
              carList = [];
              if (data['Data'] != null) {
                carList = List.generate(data['Data'].length,
                        (index) => CarInfo.fromJson(data['Data'][index]));
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
  deleteCar(context,CarInfo carInfo) {


      try {
        isLoading.value = true;
        update();

          PostService()
              .deleteCar({'id':'${carInfo.id!}'})
              .then((response) async {
            isLoading.value = false;
            update();
            if (response.statusCode == 200) {
              var data = jsonDecode(response.body);
              if (data['status']) {

              //  update();

                GetMessageConfirm(context, "${data['message']}");
                carList.remove(carInfo);
update();
              } else {

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

      } catch (e) {
        isLoading.value = false;
        print('e: $e');
        update();
      }

  }
  @override
  void dispose() {
    super.dispose();
  }
}
