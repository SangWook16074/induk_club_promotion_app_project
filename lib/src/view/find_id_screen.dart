import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class FindId extends StatelessWidget {
  const FindId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (ResponsibleLayout.isMobile(context))
          ? AppBar(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xff713eff),
              leading: GestureDetector(
                onTap: Get.back,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
              elevation: 0.0,
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: (ResponsibleLayout.isMobile(context))
                      ? MediaQuery.of(context).size.width
                      : 400,
                  decoration: (ResponsibleLayout.isMobile(context))
                      ? null
                      : BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _title(),
                          _textFields(),
                          _button(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(child: Text('아이디를 잃어버리셨나요?')),
    );
  }

  Widget _textFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '이름',
              style: Get.theme.textTheme.bodySmall,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: LoginTextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '이메일',
              style: Get.theme.textTheme.bodySmall,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: LoginTextField(),
          )
        ],
      ),
    );
  }

  Widget _button() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: SignButton(
          width: double.infinity,
          height: 40,
          child: Text(
            '확인',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )),
    );
  }
}
