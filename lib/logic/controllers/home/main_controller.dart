import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio/ui/menu_screens/contactus_view.dart';
import 'package:studio/ui/menu_screens/home_view.dart';
import 'package:studio/ui/menu_screens/prints_view.dart';
import 'package:studio/ui/menu_screens/reserves_view.dart';

class MainController extends GetxController {
  int selectedMenuItem = 0;
  late List<MenuItems> menuItems;
  @override
  void onInit() {
    super.onInit();
    menuItems = [
      MenuItems(
          label: 'Home'.tr,
          title: 'Home'.tr,
          icon: CupertinoIcons.house_alt,
          body: HomeScreen()),
      MenuItems(
          label: 'Prints'.tr,
          title: 'Prints'.tr,
          icon: CupertinoIcons.printer,
          body: PrintsScreen()),
      MenuItems(
          label: 'Reserves'.tr,
          title: 'Reserves'.tr,
          icon: CupertinoIcons.calendar_today,
          body: ReservesScreen()),
      MenuItems(
          label: 'ContactUs'.tr,
          title: 'ContactUs'.tr,
          icon: CupertinoIcons.phone,
          body: ContactUs()),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  changeMenuItem(int index) {
    selectedMenuItem = index;
    update();
  }
}

class MenuItems {
  final String label;
  final String title;
  final IconData icon;
  final Widget body;
  MenuItems(
      {required this.label,
      required this.icon,
      required this.title,
      required this.body});
}
