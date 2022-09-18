import 'package:get/get.dart';

class MainItemsController extends GetxController {
  int selectedIndex = 0;
  changeSelectedIndex(index) {
    selectedIndex = index;
    update();
  }
}
