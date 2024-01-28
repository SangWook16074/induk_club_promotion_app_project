import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:induk_club_promotion_app_project/src/constants/status.dart';
import 'package:induk_club_promotion_app_project/src/controllers/image_picker_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PromotionWriteController extends GetxController {
  // RX 객체
  final Rx<Status> _status = Rx<Status>(Status.LOADED);

  /// 각 항목별 텍스트필드 컨트롤러

  final TextEditingController title = TextEditingController();
  final TextEditingController requiredPeople = TextEditingController();
  final TextEditingController content = TextEditingController();
  final TextEditingController additional = TextEditingController();
  final TextEditingController url = TextEditingController();

  // 날짜 항목 별 시간 객체
  final Rx<DateTime> _activityBegin =
      Rx<DateTime>(DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()));
  final Rx<DateTime> _activityEnd =
      Rx<DateTime>(DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()));
  final Rx<DateTime> _recruitmentBegin =
      Rx<DateTime>(DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()));
  final Rx<DateTime> _recruitmentEnd =
      Rx<DateTime>(DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()));

  // 기타 객체
  final FirebaseStorage storage = FirebaseStorage.instance;
  final PromotionRepository promotionRepository;

  PromotionWriteController({required this.promotionRepository});

  DateTime get activityBegin => _activityBegin.value;
  DateTime get activityEnd => _activityEnd.value;
  DateTime get recruitmentBegin => _recruitmentBegin.value;
  DateTime get recruitmentEnd => _recruitmentEnd.value;

  Status get status => _status.value;

  void uploadImagesOnWeb() async {
    List<Uint8List> images = Get.find<ImagePickerController>().webImages;
    var uuid = const Uuid();
    final ref = storage.ref();
    List<String> urls = [];
    _status(Status.LOADING);

    /// 이미지 스토리지 저장
    for (var image in images) {
      try {
        var uploadRef = ref.child("${uuid.v1().toString()}.jpg");
        await uploadRef.putData(image);
        final url = await uploadRef.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print(e.toString());
        _status(Status.ERROR);
        throw Exception("Fail to send data to server");
      }
    }

    if (_status.value != Status.ERROR) {
      uploadPromotion(urls);
    }
  }

  void uploadImages() async {
    List<XFile> images = Get.find<ImagePickerController>().images;
    var uuid = const Uuid();
    final ref = storage.ref();
    List<String> urls = [];
    _status(Status.LOADING);

    /// 이미지 스토리지 저장
    for (var image in images) {
      try {
        var uploadRef = ref.child("${uuid.v1().toString()}.jpg");
        await uploadRef.putFile(File(image.path));
        final url = await uploadRef.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print(e.toString());
        _status(Status.ERROR);
        throw Exception("Fail to send data to server");
      }
    }
    uploadPromotion(urls);
  }

  void uploadPromotion(List<String> images) {
    final user = Get.find<MemberController>().member;
    final data = {
      "title": title.value.text.toString(),
      "content": content.value.text.toString(),
      "club": user?.club?.clubName,
      "createAt": _activityBegin.value.toString(),
      "closeAt": _activityEnd.value.toString(),
      "begin": _recruitmentBegin.value.toString(),
      "end": _recruitmentEnd.value.toString(),
      "requiredPeople": int.parse(requiredPeople.value.text.toString()),
      "contentOfActivity": additional.value.text.toString(),
      "url": url.value.text.toString(),
      "images": images,
    };
    print(data);
    Get.find<PromotionController>().createPromotion(data);
  }

  /// 활동시작일 설정
  void setAcitivityBegin(DateTime? dateTime) {
    if (dateTime != null) {
      _activityBegin(dateTime);
    }
  }

  // 활동종료일 설정
  void setAcitivityEnd(DateTime? dateTime) {
    if (dateTime != null) {
      _activityEnd(dateTime);
    }
  }

  void setRecruitmentBegin(DateTime? dateTime) {
    if (dateTime != null) {
      _recruitmentBegin(dateTime);
    }
  }

  void setRecruitmentEnd(DateTime? dateTime) {
    if (dateTime != null) {
      _recruitmentEnd(dateTime);
    }
  }

  void showUploadDialog() {
    /// 빈칸은 허용 안됨
    if (title.value.text == "") {
      print("제목이 비었습니다 !");
      return;
    }

    if (requiredPeople.value.text == "") {
      print("모집인원이 비었습니다 !");
      return;
    }

    if (content.value.text == "") {
      print("동아리소개가 비었습니다 !");
      return;
    }

    if (additional.value.text == "") {
      print("활동내용이 비었습니다 !");
      return;
    }

    Get.dialog(CustomDialog(
      width: 300,
      title: "홍보글 작성을 완료하시겠습니까?",
      confirm: () {
        Get.back();
        (kIsWeb) ? uploadImagesOnWeb() : uploadImages();
      },
      cancel: () {
        Get.back();
      },
    ));
  }

  void showCancelDialog() {
    Get.dialog(CustomDialog(
      width: 300,
      title: "작성을 취소할까요?",
      confirm: () {
        Get.back();
        Get.back();
      },
      cancel: () {
        Get.back();
      },
    ));
  }
}
