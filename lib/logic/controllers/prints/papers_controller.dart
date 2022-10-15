import 'package:get/get.dart';
import 'package:studio/models/print.dart';

class PapersController extends GetxController {
  var isLoading = false.obs;
  RxList<PrintData> paperDataList = <PrintData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    paperDataList.value = [
      PrintData(image: 'assets/images/A6.jpg', size: 'A6', price: 2.50),
      PrintData(image: 'assets/images/A5.jpg', size: 'A5', price: 10),
      PrintData(image: 'assets/images/A4.jpg', size: 'A4', price: 25),
      PrintData(image: 'assets/images/A4.jpg', size: 'A4', price: 25),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
