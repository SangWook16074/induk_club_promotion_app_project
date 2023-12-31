import 'package:flutter/material.dart';

enum SearchBarType { DESKTOP, MOBILE }

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
