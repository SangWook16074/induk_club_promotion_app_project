import 'dart:ui';

import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  const BasicBox(
      {super.key, this.child, this.height, this.width, this.radius = 24.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffE6E6E6),
                    Color(0xffE6E6E6),
                  ]),
              borderRadius: BorderRadius.circular(radius!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: const Offset(0, 200), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: child),
      ),
    );
  }
}
