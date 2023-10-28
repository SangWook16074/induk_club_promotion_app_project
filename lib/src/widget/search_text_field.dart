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
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: const Color(0xff2e2e2e).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25.0)),
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    hintText: '동아리 정보를 입력하세요.',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xffffffff),
                    suffixIcon: Icon(Icons.close),
                    suffixIconColor: Color(0xffffffff),
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
