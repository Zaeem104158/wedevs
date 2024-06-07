import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextDecoration? textDecoration;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double? letterSpacing;
  final double? lineHeight;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.black,
    this.textDecoration,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.letterSpacing,
    this.lineHeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: lineHeight,
        decoration: textDecoration,
      ),
      
      textAlign: textAlign,
    );
  }
}
