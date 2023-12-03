import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const MenuItem({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
