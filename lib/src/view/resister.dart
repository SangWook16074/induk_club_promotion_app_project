import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/resister_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class Resister extends StatefulWidget {
  const Resister({super.key});

  @override
  State<Resister> createState() => _ResisterState();
}

class _ResisterState extends State<Resister> {
  final controller = Get.find<ResisterController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: Get.back,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff713eff),
            ),
          ),
          title: Text(
            "회원가입",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: (!ResponsibleLayout.isMobile(context) ? 500 : null),
                child: Column(
                  children: [
                    _eamil(),
                    const SizedBox(
                      height: 20,
                    ),
                    _name(),
                    const SizedBox(
                      height: 20,
                    ),
                    _password(),
                    const SizedBox(
                      height: 10,
                    ),
                    _header(),
                    _terms(),
                    _check(),
                    _button(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _eamil() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "이메일",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LoginTextField(
              type: TextInputType.emailAddress,
              controller: controller.email,
              hintText: "ex)example@example.com",
            ),
          ),
        ],
      );

  Widget _name() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "회원이름",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LoginTextField(
              controller: controller.name,
              hintText: "ex)홍길동",
            ),
          ),
        ],
      );

  Widget _password() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "비밀번호",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LoginTextField(
              obscureText: true,
              controller: controller.password,
              hintText: "비밀번호를 입력해주세요.",
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "비밀번호 확인",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LoginTextField(
              obscureText: true,
              controller: controller.passwordAgain,
              hintText: "비밀번호를 다시 입력해주세요.",
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "비밀번호는 영어대문자+영어소문자+특수문자를 포함한 10자리 이상이어야 합니다.",
              style: TextStyle(fontSize: 13, color: Color(0xff4e4e4e)),
            ),
          )
        ],
      );

  Widget _terms() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 500,
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: const Color(0xff713eff))),
          child: SingleChildScrollView(child: Text('약관내용' * 10000))),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '약관동의',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _check() {
    return GetX<ResisterController>(builder: (controller) {
      return Row(
        children: [
          Checkbox(
            value: (controller.isAgree) ? true : false,
            onChanged: controller.agree,
            checkColor: Colors.white,
            side: const BorderSide(color: Color(0xff713eff), width: 2.0),
          ),
          const Text(
            '동의',
            style: TextStyle(color: Colors.black),
          ),
          Checkbox(
            value: (controller.isAgree) ? false : true,
            onChanged: controller.disagree,
            side: const BorderSide(color: Color(0xff713eff), width: 2.0),
          ),
          const Text(
            '동의하지 않음',
            style: TextStyle(color: Colors.black),
          )
        ],
      );
    });
  }

  Widget _button() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SignButton(
            width: double.infinity,
            height: 60,
            onPressed: controller.signUp,
            child: const Text(
              "회원가입",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      );
}
