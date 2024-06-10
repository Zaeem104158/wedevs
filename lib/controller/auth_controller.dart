import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/service/api_service.dart';

class AuthController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final passwordVisibility = false.obs;
  final ApiService _apiService = ApiService();
  final email = "".obs;
  final password = "".obs;
  final validate = false.obs;

  login() async {
    var request = {
      "username": email.value,
      "password": password.value,
    };
    log("message: $request");
    var data = await _apiService.post(HeaderType.xwwwurlencoded,"/jwt-auth/v1/token", request);
    if (data['token'] != null) {
      log("message: ${data['token']}");
    }
  }
}
