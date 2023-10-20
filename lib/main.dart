import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/init_binding.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff9933ff)),
          scaffoldBackgroundColor: const Color(0xffffffff)),
      home: const PromotionView(),
      initialBinding: InitBinding(),
    );
  }
}
