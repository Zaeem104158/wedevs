import 'package:flutter/material.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/const/image_path.dart';
import 'package:wedevs/component/svg_image_component.dart';

class CircleAvatarWithCamera extends StatelessWidget {
  final Alignment alignment;
  final double radius;
  final String? imageUrl;
  final Color? iconColor;
  final Gradient? iconGradient;
  final Widget? iconWidget;
  final VoidCallback onCameraTap;

  const CircleAvatarWithCamera({
    super.key,
    this.alignment = Alignment.center,
    this.iconColor,
    this.iconGradient,
    this.iconWidget,
    required this.radius,
    this.imageUrl,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Stack(
        children: [
          Material(
            shape: CircleBorder(),
            elevation: 4,
            child: CircleAvatar(
              radius: radius,
              backgroundColor: HexColor(ColorConst.whiteColor),
              // backgroundImage: NetworkImage(imageUrl),
              child: const SvgImage(
                assetName: ImagePath.userIcon,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                height: radius / 2,
                width: radius / 2,
                decoration: BoxDecoration(
                  color: iconColor,
                  gradient: iconGradient,
                  shape: BoxShape.circle,
                ),
                child: iconWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
