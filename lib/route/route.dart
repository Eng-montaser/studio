import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:studio/logic/bindings/bindings.dart';
import 'package:studio/ui/login.dart';
import 'package:studio/ui/main_view.dart';
import 'package:studio/ui/splash_view.dart';

class AppRoutes {
  static const splash = Routes.splash;
  static const main = Routes.main;
  static const login = Routes.login;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.main, page: () => MainScreen()),
  ];
}

class Routes {
  static const splash = '/';
  static const main = '/main';

  /// auth
  static const login = '/login';

  ///users

}
