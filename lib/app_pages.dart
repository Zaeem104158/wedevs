import 'package:get/get.dart';
import 'package:wedevs/app_routes.dart';
import 'package:wedevs/auth_controller.dart';
import 'package:wedevs/signup_pages.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    // GetPage(
    //   name: AppRoutes.LOGIN,
    //   page: () => LoginPage(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<LoginController>(() => LoginController());
    //   }),
    // ),
  ];
}
