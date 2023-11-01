import 'dart:ui';

import 'package:flutter/material.dart';

enum SearchBarType { DESKTOP, MOBILE }

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final SearchBarType type;
  const SearchTextField(
      {super.key, required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      SearchBarType.DESKTOP =>
        _basic(width: MediaQuery.of(context).size.width / 3),
      SearchBarType.MOBILE =>
        _basic(width: MediaQuery.of(context).size.width - 30)
    };
  }

  Widget _basic({
    required double width,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff713eff), width: 2),
              borderRadius: BorderRadius.circular(25.0),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: controller,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Color(0xff713eff),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
