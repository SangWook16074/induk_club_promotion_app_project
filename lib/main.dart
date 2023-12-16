import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';
import 'package:induk_club_promotion_app_project/src/contants/kakao_api_key.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/bindings/init_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: KakaoApiKey.nativeKey,
      javaScriptAppKey: KakaoApiKey.javascriptKey);
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: const Color(0xff713eff),
          textTheme: const TextTheme(
              labelLarge: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              labelMedium: TextStyle(
                color: Colors.white,
              ),
              titleMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              bodyMedium: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              bodySmall: TextStyle(
                color: Color(0xff4e4e4e),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              displayLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
              displayMedium: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              headlineMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff9933ff)),
          scaffoldBackgroundColor: const Color(0xffffffff)),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
