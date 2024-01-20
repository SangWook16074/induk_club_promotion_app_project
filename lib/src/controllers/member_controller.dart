import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:intl/intl.dart';

class MemberController extends GetxController {
  final Rxn<Member> _member = Rxn<Member>();
  final Rx<DateTime> initDate =
      Rx<DateTime>(DateFormat("yyyy-MM-dd").parse("2000-01-01"));
  final RxString classify = "중앙동아리".obs;
  final MemberRepository memberRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  MemberController({required this.memberRepository});

  Member? get member => _member.value;

  /// 사용자 정보 조회
  void fetchMemberData() async {
    final token = Get.find<LoginController>().token;
    if (token == null) return;
    final member = await memberRepository.searchMyInfo(token);
    if (member != null) {
      print(member.name);
      print(member.club);
      _member(member);
    }
  }

  void showClubInfoDialog() => Get.bottomSheet(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("동아리 이름"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoginTextField(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("개설일"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetX<MemberController>(builder: (controller) {
                    return Text(DateFormat.yMd().format(initDate.value));
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      minimumYear: 1900,
                      maximumYear: DateTime.now().year,
                      initialDateTime: initDate.value,
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: onDateTimeChanged,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("동아리분류"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetX<MemberController>(builder: (controller) {
                        return DropdownButton(
                            value: classify.value,
                            items: const [
                              DropdownMenuItem(
                                value: "중앙동아리",
                                child: Text(
                                  "중앙동아리",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "사설동아리",
                                child: Text(
                                  "사설동아리",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "연합동아리",
                                child: Text(
                                  "연합동아리",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ],
                            onChanged: onChange);
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff713eff)),
                          onPressed: () {},
                          child: const Text(
                            "저장하기",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ))),
                ),
              ],
            ),
          ),
        ),
      );

  void onDateTimeChanged(DateTime value) {
    initDate.value = value;
  }

  void onChange(value) {
    classify.value = value;
  }
}
