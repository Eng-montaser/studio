import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:studio/logic/bindings/bindings.dart';
import 'package:studio/ui/authentication/login.dart';
import 'package:studio/ui/authentication/register.dart';
import 'package:studio/ui/main_view.dart';
import 'package:studio/ui/splash_view.dart';

class AppRoutes {
  static const main = Routes.main;
  static const splash = Routes.splash;

  static const login = Routes.login;
  static const register = Routes.register;

  static final routes = [
    GetPage(name: Routes.main, page: () => MainScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),
    GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.login, page: () => LoginScreen()),

  ];
}

class Routes {
  static const main = '/main';
  static const register = '/register';
  static const splash = '/';


  /// auth
  static const login = '/login';

  ///users

}
