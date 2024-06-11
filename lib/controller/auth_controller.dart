import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/const/text_const.dart';
import 'package:wedevs/model/user_model.dart';
import 'package:wedevs/pref/pref_keys.dart';
import 'package:wedevs/pref/shared_pref.dart';
import 'package:wedevs/route_setting/app_routes.dart';
import 'package:wedevs/service/env.dart';
import 'package:wedevs/service/api_service.dart';

class AuthController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final passwordVisibility = true.obs;
  final confirmPasswordVisibility = true.obs;
  final ApiService _apiService = ApiService(environment: Environment.test);
  SharedPref prefs = SharedPref.instance;
  final name = "".obs;
  final email = "".obs;
  final password = "".obs;
  final confirmPassword = "".obs;
  final validate = false.obs;

  signup() async {
    var request = {
      "username": name.value,
      "email": email.value,
      "password": password.value
    };
    log("message: $request");
    var data = await _apiService.post(
        HeaderType.json, "/wp/v2/users/register", request);

    if (data['code'] == 200) {
      Get.snackbar(data['message'], "",
          backgroundColor: HexColor(ColorConst.greenColor),
          colorText: HexColor(ColorConst.whiteColor));
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.snackbar(data['message'], "",
          backgroundColor: HexColor(ColorConst.errorColor),
          colorText: HexColor(ColorConst.whiteColor));
    }
    return null;
  }

  login() async {
    var request = {
      "username": email.value,
      "password": password.value,
    };
    log("message: $request");
    var data = await _apiService.post(
        HeaderType.xwwwurlencoded, "/jwt-auth/v1/token", request);

    //log("Response: ${data['code']}");
    if (data['token'] != null) {
      Get.snackbar(TextConst.loginSuccessfull, "",
          backgroundColor: HexColor(ColorConst.greenColor),
          colorText: HexColor(ColorConst.whiteColor));
      prefs.saveString(loggedUser, jsonEncode(data));
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar(data['code'].split(" ")[1], "",
          backgroundColor: HexColor(ColorConst.errorColor),
          colorText: HexColor(ColorConst.whiteColor));
    }
  }
}
