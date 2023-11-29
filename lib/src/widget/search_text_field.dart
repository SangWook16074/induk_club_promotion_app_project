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
      SearchBarType.MOBILE => _basic(width: 1000)
    };
  }

  Widget _basic({
    required double width,
  }) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide:
                    const BorderSide(width: 1.5, color: Color(0xff731eff))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide:
                    const BorderSide(width: 1.5, color: Color(0xff731eff))),
            isDense: true,
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: const Color(0xff713eff),
            border: InputBorder.none),
      ),
    );
  }
}
