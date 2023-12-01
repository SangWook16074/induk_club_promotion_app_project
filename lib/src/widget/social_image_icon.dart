import 'package:flutter/material.dart';

class SocialImageIcon extends StatelessWidget {
  final String path;
  final double? width;
  final double? heigth;
  const SocialImageIcon(
      {super.key, required this.path, this.width = 50, this.heigth = 50});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}

class SocialImagePath {
  static String get apple => "assets/images/apple_icon.png";
  static String get google => "assets/images/google_icon.png";
}
