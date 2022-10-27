import 'package:get/get.dart';
import 'package:studio/models/print.dart';

class AlbumController extends GetxController {
  var isLoading = false.obs;
  RxList<PrintData> paperDataList = <PrintData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    paperDataList.value = [
      PrintData(image: 'assets/images/21x30.png', size: 'A6', price: 2.50),
      PrintData(image: 'assets/images/21x30.png', size: 'A5', price: 10),
      PrintData(image: 'assets/images/21x30.png', size: 'A4', price: 25),
      PrintData(image: 'assets/images/21x30.png', size: 'A4', price: 25),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
