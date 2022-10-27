import 'package:get/get.dart';
import 'package:studio/models/print.dart';

class LayersController extends GetxController {
  var isLoading = false.obs;
  RxList<PrintData> paperDataList = <PrintData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    paperDataList.value = [
      PrintData(image: 'assets/images/1l.png', size: '15x20', price: 2.50),
      PrintData(image: 'assets/images/2l.png', size: '20x30', price: 10),
      PrintData(image: 'assets/images/3l.png', size: '30x40', price: 25),
      PrintData(image: 'assets/images/4l.png', size: '50x70', price: 35),
      PrintData(image: 'assets/images/5l.png', size: '60x90', price: 45),
      PrintData(image: 'assets/images/6l.png', size: '70x100', price: 55),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
