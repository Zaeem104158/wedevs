import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    var data = await _apiService.post("/wp/v2/users/register", request);
    if (data['token'] != null) {
      log("messafe: ${data['token']}");
    }
  }
}
