import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xffefcabe)),
          focusColor: Colors.black,
          scaffoldBackgroundColor: const Color(0xfff1dcd5)),
      home: const App(),
    );
  }
}
