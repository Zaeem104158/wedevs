import 'package:flutter/material.dart';

double convertPixelToLogicalSize(context,double pixel){
  // Get the device pixel ratio
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Convert pixel size to logical size
    return pixel / devicePixelRatio;
}

class HexColor extends Color {
  // Constructor that calls the super constructor of Color with the int value
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  // Method to convert the hex value to a Color int value
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // 8 char with default 100% opacity
    }
    return int.parse(hexColor, radix: 16);
  }
}