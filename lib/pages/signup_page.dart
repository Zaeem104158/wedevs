import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/route_setting/app_routes.dart';
import 'package:wedevs/controller/auth_controller.dart';
import 'package:wedevs/component/circle_avatar_component.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/component/custom_button_component.dart';

import 'package:wedevs/component/custom_textfromfield_component.dart';
import 'package:wedevs/const/image_path.dart';
import 'package:wedevs/component/svg_image_component.dart';
import 'package:wedevs/const/text_const.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 121.53,
                  width: 121.53,
                  child: CircleAvatarWithCamera(
                    alignment: Alignment.center,
                    radius: 50,
                    iconGradient: LinearGradient(
                        colors: [HexColor("#F2709C"), HexColor("#FF9472")]),
                    iconWidget: SizedBox(
                        height: 34.11,
                        width: 34.11,
                        child: SvgImage(
                          assetName: ImagePath.cameraIcon,
                          colorFilter: ColorFilter.mode(
                              HexColor(ColorConst.whiteColor), BlendMode.srcIn),
                        )),
                    onCameraTap: () {
                      //('Camera icon tapped!');
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: authController.signupFormKey,
                child: Column(
                  children: [
                    CustomTextFromField(
                      onChanged: (value) {
                        if (value != null || value!.isNotEmpty) {
                          authController.name.value = value;
                        }

                        return authController.name.value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      decoration: BoxDecoration(
                        boxShadow: authController.validate.value
                            ? [
                                BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]
                            : [],
                      ),
                      filled: true,
                      filledColor: HexColor(ColorConst.whiteColor),
                      hintText: TextConst.name,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      inputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      inputBorderColor: HexColor(ColorConst.whiteColor),
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      errorOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      errorOutLineInputBorderColor:
                          HexColor(ColorConst.errorColor),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.emailIcon,
                        ),
                      ),
                    ),
                    CustomTextFromField(
                      onChanged: (value) {
                        if (value != null || value!.isNotEmpty) {
                          authController.email.value = value;
                        }

                        return authController.email.value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else {
                          return null;
                        }
                      },
                       obscureText: false,
                      decoration: BoxDecoration(
                        boxShadow: authController.validate.value
                            ? [
                                BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]
                            : [],
                      ),
                      filled: true,
                      filledColor: HexColor(ColorConst.whiteColor),
                      hintText: TextConst.email,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      inputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      inputBorderColor: HexColor(ColorConst.whiteColor),
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      errorOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      errorOutLineInputBorderColor:
                          HexColor(ColorConst.errorColor),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.emailIcon,
                        ),
                      ),
                    ),
                    CustomTextFromField(
                      onChanged: (value) {
                        if (value != null || value!.isNotEmpty) {
                          authController.password.value = value;
                        }

                        return authController.password.value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else {
                          return null;
                        }
                      },
                      decoration: BoxDecoration(
                        boxShadow: authController.validate.value
                            ? [
                                BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]
                            : [],
                      ),
                      filled: true,
                      filledColor: HexColor(ColorConst.whiteColor),
                      hintText: TextConst.password,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      inputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      inputBorderColor: HexColor(ColorConst.whiteColor),
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      errorOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      errorOutLineInputBorderColor:
                          HexColor(ColorConst.errorColor),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.passwordIcon,
                        ),
                      ),
                      obscureText: authController.passwordVisibility.value,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          authController.passwordVisibility.value =
                              !authController.passwordVisibility.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 16),
                          child: Icon(
                            !authController.passwordVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: HexColor(ColorConst.hintTextColor),
                          ),
                        ),
                      ),
                    ),
                    CustomTextFromField(
                      onChanged: (value) {
                        if (value != null || value!.isNotEmpty) {
                          authController.confirmPassword.value = value;
                        }

                        return authController.confirmPassword.value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (authController.password.value != value) {
                          return "Passwords aren't match";
                        } else {
                          return null;
                        }
                      },
                      decoration: BoxDecoration(
                        boxShadow: authController.validate.value
                            ? [
                                BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]
                            : [],
                      ),
                      filled: true,
                      filledColor: HexColor(ColorConst.whiteColor),
                      hintText: TextConst.confirmPassword,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      inputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      inputBorderColor: HexColor(ColorConst.whiteColor),
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor:
                          HexColor(ColorConst.whiteColor),
                      errorOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      errorOutLineInputBorderColor:
                          HexColor(ColorConst.errorColor),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.passwordIcon,
                        ),
                      ),
                      obscureText:
                          authController.confirmPasswordVisibility.value,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          authController.confirmPasswordVisibility.value =
                              !authController.confirmPasswordVisibility.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 16),
                          child: Icon(
                            !authController.confirmPasswordVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: HexColor(ColorConst.hintTextColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomButton(
                          backgroundColor: HexColor(ColorConst.buttonColor),
                          borderRadius: 10,
                          elevation: 2,
                          widget: const Text(TextConst.signUp),
                          textColor: HexColor(ColorConst.whiteColor),
                          onPressed: () {
                            if (authController.signupFormKey.currentState!
                                .validate()) {
                              authController.signupFormKey.currentState!.save();
                              authController.validate.value = true;
                              authController.signup();
                            }
                            //Get.offAllNamed(AppRoutes.home);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CustomButton(
                            height: 56,
                            width: 56,
                            backgroundColor: HexColor(ColorConst.whiteColor),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            borderRadius: 10,
                            elevation: 2,
                            widget: const SvgImage(
                                assetName: ImagePath.facebookIcon),
                            textColor: HexColor(ColorConst.whiteColor),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CustomButton(
                            height: 56,
                            width: 56,
                            backgroundColor: HexColor(ColorConst.whiteColor),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            borderRadius: 10,
                            elevation: 2,
                            widget:
                                const SvgImage(assetName: ImagePath.googleIcon),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            Get.offAllNamed(AppRoutes.login);
                          },
                          /*CustomText(
                            color: HexColor(ColorConst.hintTextColor),
                            text: TextConst.alreadyHaveAnAccount,
                            fontWeight: FontWeight.w300,
                            fontSize: 17.36,
                          ) */
                          child: RichText(
                            text: TextSpan(
                                text: "${TextConst.alreadyHaveAnAccount} ",
                                style: TextStyle(
                                  color: HexColor(ColorConst.greyColor),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17.36,
                                ),
                                children: [
                                  TextSpan(
                                    text: TextConst.login,
                                    style: TextStyle(
                                      color: HexColor(ColorConst.blueColor),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.36,
                                    ),
                                  ),
                                ]),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
