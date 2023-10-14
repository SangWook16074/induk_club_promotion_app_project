// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Widget icon;
  const SideMenuItem({
    Key? key,
    required this.label,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
          child: icon,
        ),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
