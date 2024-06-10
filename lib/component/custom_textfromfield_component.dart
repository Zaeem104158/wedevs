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
  final BorderRadius inputBorderRadius;
  final Color inputBorderColor;
  final BorderRadius focusedOutLineInputBorderRadius;
  final Color focusedOutLineInputBorderColor;
  final BorderRadius enableOutLineInputBorderRadius;
  final Color enableOutLineInputBorderColor;
  final BorderRadius errorOutLineInputBorderRadius;
  final Color errorOutLineInputBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? onChanged;
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
    required this.inputBorderRadius,
    required this.inputBorderColor,
    required this.focusedOutLineInputBorderRadius,
    required this.focusedOutLineInputBorderColor,
    required this.enableOutLineInputBorderRadius,
    required this.enableOutLineInputBorderColor,
    required this.errorOutLineInputBorderRadius,
    required this.errorOutLineInputBorderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = true,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: decoration,
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText,
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
            border: OutlineInputBorder(
               borderRadius:inputBorderRadius,
                borderSide: BorderSide(
                color: inputBorderColor,
              ), 
               ),
            errorBorder: OutlineInputBorder(
              borderRadius: errorOutLineInputBorderRadius,
              borderSide: BorderSide(
                color: errorOutLineInputBorderColor,
              ),
            ),
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
