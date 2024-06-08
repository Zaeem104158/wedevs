import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? widget;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  const CustomButton(
      {super.key,
      this.widget,
      this.height,
      this.width,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius,
      this.elevation,
      this.onPressed,
      this.padding,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? Theme.of(context).primaryColor),
          foregroundColor: WidgetStateProperty.all(textColor ?? Colors.white),
          padding: WidgetStateProperty.all(padding ??
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
          elevation: WidgetStateProperty.all(elevation),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
        ),
        child: widget,
      ),
    );
  }
}
