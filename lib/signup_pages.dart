import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/auth_controller.dart';
import 'package:wedevs/color_const.dart';
import 'package:wedevs/const_methods.dart';
import 'package:wedevs/custom_submit_button.dart';
import 'package:wedevs/custom_text.dart';
import 'package:wedevs/custom_textfromfield.dart';
import 'package:wedevs/image_path.dart';
import 'package:wedevs/svg_image_component.dart';
import 'package:wedevs/text_const.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 100,
              ),
              const SvgImage(assetName: ImagePath.appLogo),
              const SizedBox(
                height: 100,
              ),
              const CustomText(
                text: TextConst.signIn,
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: authController.signupFormKey,
                child: Column(
                  children: [
                    CustomTextFromField(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                      filled: true,
                      filledColor: ColorConst.whiteColor,
                      hintText: TextConst.email,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor: ColorConst.whiteColor,
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor: ColorConst.whiteColor,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.emailIcon,
                        ),
                      ),
                    ),
                    CustomTextFromField(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                      filled: true,
                      filledColor: ColorConst.whiteColor,
                      hintText: TextConst.password,
                      hintTextColor: HexColor(ColorConst.hintTextColor),
                      hintTextFontSize: 17.36,
                      hintTextFontWeight: FontWeight.w400,
                      focusedOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      focusedOutLineInputBorderColor: ColorConst.whiteColor,
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor: ColorConst.whiteColor,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 16),
                        child: SvgImage(
                          assetName: ImagePath.passwordIcon,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          authController.passwordVisibility.value =
                              !authController.passwordVisibility.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 16),
                          child: Icon(
                            authController.passwordVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: HexColor(ColorConst.hintTextColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              color: HexColor(ColorConst.hintTextColor),
                              text: TextConst.forgetPassword,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            )),
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
                        child: CustomSubmitButton(
                          backgroundColor: HexColor(ColorConst.buttonColor),
                          borderRadius: 10,
                          elevation: 2,
                          text: TextConst.login,
                          textColor: ColorConst.whiteColor,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){},
                        child: CustomSubmitButton(
                          backgroundColor: HexColor(ColorConst.buttonColor),
                          borderRadius: 10,
                          elevation: 2,
                          text: TextConst.login,
                          textColor: ColorConst.whiteColor,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {},
                          child: CustomText(
                            color: HexColor(ColorConst.hintTextColor),
                            text: TextConst.createNewAccount,
                            fontWeight: FontWeight.w300,
                            fontSize: 17.36,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
