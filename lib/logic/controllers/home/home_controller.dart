import 'package:get/get.dart';
import 'package:studio/models/print.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  RxList<PrintData> printDataList = <PrintData>[].obs;
  RxList<PrintData> reserveDataList = <PrintData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    printDataList.value = [
      PrintData(image: 'assets/images/canab.jpeg', size: 'Layers'.tr),
      PrintData(image: 'assets/images/book.jpeg', size: 'Albums'.tr),
      PrintData(image: 'assets/images/pictures.jpeg', size: 'Papers'.tr),
    ];
    reserveDataList.value = [
      PrintData(image: 'assets/images/02.jpeg', size: 'Wedding'.tr),
      PrintData(image: 'assets/images/albn.jpg', size: 'Graduates'.tr),
      PrintData(image: 'assets/images/back2.jpg', size: 'Trades'.tr),
      PrintData(image: 'assets/images/girlguy.jpg', size: 'Births'.tr),
      PrintData(image: 'assets/images/wedding_home1.jpg', size: 'Model'.tr),
      PrintData(image: 'assets/images/wedding_home6.png', size: 'Cinema'.tr),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
