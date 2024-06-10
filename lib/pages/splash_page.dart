import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs/component/svg_image_component.dart';
import 'package:wedevs/const/image_path.dart';
import 'package:wedevs/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return const Scaffold(
      body: Center(
        child: SvgImage(assetName: ImagePath.appLogo),
      ),
    );
  }
}