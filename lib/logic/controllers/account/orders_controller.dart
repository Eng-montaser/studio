import 'package:get/get.dart';
import 'package:studio/models/order.dart';

class OrdersController extends GetxController {
  var isLoading = false.obs;
  RxList<OrderData> currentOrder = <OrderData>[].obs;
  RxList<OrderData> prevOrder = <OrderData>[].obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    currentOrder.value = [
      OrderData(
          image: 'assets/images/canab.jpeg',
          name: 'لوحة',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'لوحة',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/canab.jpeg',
          name: 'لوحة',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/canab.jpeg',
          name: 'لوحة',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/canab.jpeg',
          name: 'لوحة',
          size: '70X100',
          price: 500),
    ];
    prevOrder.value = [
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'البوم',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'البوم',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'البوم',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'البوم',
          size: '70X100',
          price: 500),
      OrderData(
          image: 'assets/images/book.jpeg',
          name: 'البوم',
          size: '70X100',
          price: 500),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
