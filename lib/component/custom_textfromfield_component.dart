import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final BoxDecoration? decoration;
  final bool? filled;
  final Color? filledColor;
  final String? hintText;
  final Color? hintTextColor;
  final double? hintTextLetterSpacing;
  final double? hintTextFontSize;
  final FontWeight? hintTextFontWeight;
  final double? hintTextLineHeight;
  final BorderRadius focusedOutLineInputBorderRadius;
  final Color focusedOutLineInputBorderColor;
  final BorderRadius enableOutLineInputBorderRadius;
  final Color enableOutLineInputBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFromField({
    super.key,
    this.decoration,
    this.filled,
    this.filledColor,
    this.hintText,
    this.hintTextColor,
    this.hintTextFontSize,
    this.hintTextLetterSpacing,
    this.hintTextFontWeight,
    this.hintTextLineHeight,
    required this.focusedOutLineInputBorderRadius,
    required this.focusedOutLineInputBorderColor,
    required this.enableOutLineInputBorderRadius,
    required this.enableOutLineInputBorderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: decoration,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            filled: filled,
            fillColor: filledColor,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor,
              letterSpacing: hintTextLetterSpacing,
              fontSize: hintTextFontSize,
              fontWeight: hintTextFontWeight,
              height: hintTextLineHeight,
            ),
            hintTextDirection: TextDirection.ltr,
            alignLabelWithHint: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: focusedOutLineInputBorderRadius,
              borderSide: BorderSide(
                color: focusedOutLineInputBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: enableOutLineInputBorderRadius,
              borderSide: BorderSide(color: enableOutLineInputBorderColor),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
