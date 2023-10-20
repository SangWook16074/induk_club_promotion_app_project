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
              color: const Color(0xff1e1e1e).withOpacity(0.8),
              border: Border.all(width: 3.0, color: Colors.white),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: child),
      ),
    );
  }
}
