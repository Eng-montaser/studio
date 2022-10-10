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
          image: 'assets/images/house.png',
          body: HomeScreen()),
      MenuItems(
          label: 'Prints'.tr,
          title: 'Prints'.tr,
          image: 'assets/images/printer.png',
          body: PrintsScreen()),
      MenuItems(
          label: 'Reserves'.tr,
          title: 'Reserves'.tr,
          image: 'assets/images/calendar.png',
          body: ReservesScreen()),
      MenuItems(
          label: 'ContactUs'.tr,
          title: 'ContactUs'.tr,
          image: 'assets/images/account.png',
          body: ContactUs()),
      MenuItems(
          label: 'ContactUs'.tr,
          title: 'ContactUs'.tr,
          image: 'assets/images/call.png',
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
  final String image;
  final Widget body;
  MenuItems(
      {required this.label,
      required this.image,
      required this.title,
      required this.body});
}
