import 'package:get/get.dart';
import 'package:wedevs/controller/home_controller.dart';
import 'package:wedevs/pages/home_page.dart';
import 'package:wedevs/route_setting/app_routes.dart';
import 'package:wedevs/controller/auth_controller.dart';
import 'package:wedevs/pages/login_page.dart';
import 'package:wedevs/pages/signup_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
  ];
}
