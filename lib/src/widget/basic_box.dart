import 'dart:ui';

import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  const BasicBox({super.key, this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
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
                    Color(0xff3e3e3e),
                    Color(0xff2e2e2e),
                  ]),
              borderRadius: BorderRadius.circular(24.0),
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
