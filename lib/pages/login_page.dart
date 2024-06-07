import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/route_setting/app_routes.dart';
import 'package:wedevs/controller/auth_controller.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/component/custom_button_component.dart';
import 'package:wedevs/component/custom_text_component.dart';
import 'package:wedevs/component/custom_textfromfield_component.dart';
import 'package:wedevs/const/image_path.dart';
import 'package:wedevs/component/svg_image_component.dart';
import 'package:wedevs/const/text_const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
     
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
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
                      filledColor: HexColor(ColorConst.whiteColor),
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
                      focusedOutLineInputBorderColor: HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor: HexColor(ColorConst.whiteColor),
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
                      filledColor: HexColor(ColorConst.whiteColor),
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
                      focusedOutLineInputBorderColor: HexColor(ColorConst.whiteColor),
                      enableOutLineInputBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      enableOutLineInputBorderColor: HexColor(ColorConst.whiteColor),
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
                          widget: const Text(TextConst.login),
                          textColor: HexColor(ColorConst.whiteColor),
                          onPressed: () {},
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
                          child: CustomSubmitButton(
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
                          child: CustomSubmitButton(
                            height: 56,
                            width: 56,
                            backgroundColor: HexColor(ColorConst.whiteColor),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            borderRadius: 10,
                            elevation: 2,
                            widget:
                                const SvgImage(assetName: ImagePath.googleIcon),
                            onPressed: () {
                              
                            },
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
                            Get.offAllNamed(AppRoutes.signup);
                          },
                          child: CustomText(
                            color: HexColor(ColorConst.greyColor),
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
