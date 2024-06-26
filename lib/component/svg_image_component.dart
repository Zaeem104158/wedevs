import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SvgImage extends StatelessWidget {
  final String assetName;
  //final double width;
  //final double height;
  final ColorFilter? colorFilter;

  const SvgImage({
    super.key,
    required this.assetName,
    //this.width = 24.0,
    //this.height = 24.0,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg_icons/$assetName',
      //width: width,
      //height: height,
      colorFilter: colorFilter,
    );
  }
}
