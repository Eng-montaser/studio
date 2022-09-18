import 'package:get/get.dart';
import 'package:studio/logic/controllers/login_controller.dart';
import 'package:studio/logic/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

// class HomeBinding extends Bindings{
//   @override
//   void dependencies() {
//     Get.lazyPut(() => HomeController());
//   }
// }
// class ItemsBinding extends Bindings{
//   @override
//   void dependencies() {
//     Get.lazyPut(() => ItemsController());
//   }
// }
// class POSBinding extends Bindings{
//   @override
//   void dependencies() {
//     Get.lazyPut(() => POSController());
//   }
// }
// class TransactionBinding extends Bindings{
//   @override
//   void dependencies() {
//     Get.lazyPut(() => TransactionController());
//   }
// }
