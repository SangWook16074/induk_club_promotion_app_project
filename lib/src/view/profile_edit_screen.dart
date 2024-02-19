import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/status.dart';
import 'package:induk_club_promotion_app_project/src/controllers/find_password_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: (!ResponsibleLayout.isMobile(context) ? 500 : null),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(),
                _newpassword(),
                _passwordcheck(),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      foregroundColor: const Color(0xff731eff),
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: Get.back,
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      title: const Text(
        '비밀번호 재설정',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      centerTitle: true,
    );
  }

  Widget _header() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          "새로운 비밀번호를 입력해주세요",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
      );

  Widget _newpassword() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "새 비밀번호",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 1,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
            ),
            const Row(
              children: [
                Text(
                  "*8자 이상이면서 최소한 숫자와 글자 하나를 포함해야 합니다.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _passwordcheck() => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "새 비밀번호 확인",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 1,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
            ),
            const Row(
              children: [
                Text(
                  "*비밀번호를 다시 입력해주세요",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _button() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SignButton(
            width: double.infinity,
            height: 55,
            onPressed: () {},
            child: const Text(
              "재 설정하기 ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      );
}
