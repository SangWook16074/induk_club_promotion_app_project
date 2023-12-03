import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveImage extends StatelessWidget {
  final String path;
  final double width;
  final double heigth;
  const RiveImage(
      {super.key,
      required this.path,
      required this.width,
      required this.heigth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: RiveAnimation.asset(path),
    );
  }
}

class RiveImagePath {
  static String get complete => 'assets/rives/check_icon.riv';
}
