import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  final Widget body;
  final Widget button;
  const BasicBox({super.key, required this.body, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                body,
              ],
            ),
          ),
          Expanded(flex: 1, child: button),
        ],
      ),
    );
  }
}
