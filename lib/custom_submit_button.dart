import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  const CustomSubmitButton(
      {super.key,
      this.text,
      this.backgroundColor,
      this.borderRadius,
      this.elevation,
      this.onPressed,
      this.padding,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
      ),
      child: Text(text ?? ""),
    );
  }
}
