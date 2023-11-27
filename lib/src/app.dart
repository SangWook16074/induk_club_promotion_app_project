import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';

class App extends GetView<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeScreen());
  }
}
