import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:intl/intl.dart';

class MemberController extends GetxController {
  final Rxn<Member> _member = Rxn<Member>();
  late Rx<DateTime> initDate;
  late RxString classify;
  final MemberRepository memberRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late TextEditingController _name;

  static MemberController get to => Get.find();

  MemberController({required this.memberRepository}) {
    if (_member.value == null) {
      initDate = Rx<DateTime>(DateFormat("yyyy-MM-dd").parse("2000-01-01"));
      classify = "중앙동아리".obs;
      _name = TextEditingController();
    } else {
      initDate = Rx<DateTime>(
          DateFormat("yyyy-MM-dd").parse("${_member.value?.club?.createAt}"));
      classify = "${_member.value?.club?.classify}".obs;
      _name = TextEditingController(text: "${_member.value?.club?.clubName}");
    }
  }

  Member? get member => _member.value;

  /// 사용자 정보 조회
  void fetchMemberData() async {
    final token = Get.find<LoginController>().token;
    if (token == null) {
      print("토큰 정보 X");
      return;
    }
    final member = await memberRepository.searchMyInfo(token);
    if (member != null) {
      print(member.id);
      print(member.name);
      print(member.club);
      _member(member);
    }
  }

  /// 사용자 비밀번호 초기화
  /// 메소드
  /// 이메일을 입력하면 임의 비밀번호를 설정하고
  /// 사용자에게 전송함
  Future<String> resetPassword(String email) async {
    final data = {"email": email};
    final result = await memberRepository.resetPassword(data);
    return result;
  }

  /// 사용자가 동아리를 개설을 원하면
  /// 아래의 바텀시트에서 동아리 정보를 추가한 후
  /// 동아리를 개설할 수 있음.
  void showClubInfoDialog() => Get.bottomSheet(
        Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "동아리 개설하기",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Opacity(opacity: 0.0, child: Icon(Icons.close))
                ],
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "동아리 이름",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoginTextField(
                          controller: _name,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("개설일"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetX<MemberController>(builder: (controller) {
                          return Row(
                            children: [
                              Text(DateFormat.yMd().format(initDate.value)),
                            ],
                          );
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
                            child:
                                GetX<MemberController>(builder: (controller) {
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
                        padding: const EdgeInsets.all(24.0),
                        child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff713eff)),
                                onPressed: validateClubInfo,
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
            ],
          ),
        ),
        isScrollControlled: true,
      );

  void onDateTimeChanged(DateTime value) {
    initDate.value = value;
  }

  void onChange(value) {
    classify.value = value;
  }

  /// 동아리 정보를
  /// 서버에 저장하는 로직
  /// 저장하기를 누르면
  /// 알림창이 뜨면서 정보를 확인하게 해줌
  /// 확인을 누르면 저장됨
  /// 취소를 누르면 취소됨
  void validateClubInfo() {
    if (_name.value.text == "") {
      showToast("동아리 이름이 비었습니다.");
      return;
    }
    showConfirmAlertDialog();
  }

  void showConfirmAlertDialog() => Get.dialog(CustomDialog(
        title: "동아리 정보 확인",
        content: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "동아리 개설 직전 !",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "개설하기 전에 정보를 확인해주세요!\n동아리 정보가 확실한가요?",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "동아리 이름 : ${_name.text}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "동아리 개설일 : ${DateFormat.yMd().format(initDate.value)}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "동아리 분류 : ${classify.value}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        confirm: saveClubInfo,
        cancel: Get.back,
      ));

  void saveClubInfo() async {
    final data = {
      "clubName": _name.value.text.toString(),
      "createAt": initDate.value.toString(),
      "classify": classify.value,
    };
    final response = await memberRepository.saveClubInfo(data);
    if (response != null) {
      print(response);
      fetchMemberData();
      Get.offAll(() => const MyPage());
      _name.clear();
    }
  }

  void updateClubInfo() => Get.bottomSheet(
        Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "동아리 정보수정",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Opacity(opacity: 0.0, child: Icon(Icons.close))
                ],
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "동아리 이름",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoginTextField(
                          controller: _name,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("개설일"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetX<MemberController>(builder: (controller) {
                          return Row(
                            children: [
                              Text(DateFormat.yMd().format(initDate.value)),
                            ],
                          );
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
                            child:
                                GetX<MemberController>(builder: (controller) {
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
                        padding: const EdgeInsets.all(24.0),
                        child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff713eff)),
                                onPressed: validateClubInfo,
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
            ],
          ),
        ),
        isScrollControlled: true,
      );
  void showToast(String message) => Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: const Color(0xff8D63FF),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        fontSize: 16.0,
        gravity: ToastGravity.TOP,
      );
}
