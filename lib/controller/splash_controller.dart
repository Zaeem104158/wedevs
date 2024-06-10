import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedevs/pref/pref_keys.dart';
import 'package:wedevs/pref/shared_pref.dart';
import 'package:wedevs/route_setting/app_routes.dart';

class SplashController extends GetxController {
  SharedPref prefs = SharedPref.instance;
  @override
  void onInit() async {
    String? data = await prefs.getString(loggedUser);

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (data != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
    super.onInit();
  }
}
