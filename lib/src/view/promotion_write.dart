import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/image_picker_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';

class PromotionWrite extends StatefulWidget {
  const PromotionWrite({super.key});

  @override
  State<PromotionWrite> createState() => _PromotionWriteState();
}

class _PromotionWriteState extends State<PromotionWrite> {
  final DateTime _currentTime = DateTime.now();
  DateTime _beginTime = DateTime.now();
  DateTime _expirationTime = DateTime.now();

  Future<void> _setBegin() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _currentTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    setState(() {
      if (dateTime != null) {
        setState(() => _beginTime = dateTime);
      }
    });
  }

  Future<void> _setExpiration() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _currentTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (dateTime != null) {
      setState(() => _expirationTime = dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (ResponsibleLayout.isMobile(context)) ? 10 : 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(),
                _title(),
                _duration(),
                _requiredPeople(),
                _info(),
                _addtional(),
                _addImage(),
                _pickedImages(),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "동아리",
                    style: TextStyle(
                        fontSize:
                            (ResponsibleLayout.isMobile(context)) ? 25 : 45,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextSpan(
                      text: "홍보글",
                      style: TextStyle(
                          fontSize:
                              (ResponsibleLayout.isMobile(context)) ? 28 : 50,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff713eff))),
                  TextSpan(
                    text: "을 작성하세요.",
                    style: TextStyle(
                        fontSize:
                            (ResponsibleLayout.isMobile(context)) ? 25 : 45,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _title() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "글 제목",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              style: Theme.of(context).textTheme.displayMedium,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _duration() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "모집 기간",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${_beginTime.year}-${_beginTime.month}-${_beginTime.day}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                              onTap: _setBegin,
                              child: const Icon(Icons.calendar_today)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${_expirationTime.year}-${_expirationTime.month}-${_expirationTime.day}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                              onTap: _setExpiration,
                              child: const Icon(Icons.calendar_today)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _requiredPeople() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "모집인원",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              style: Theme.of(context).textTheme.displayMedium,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _info() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "동아리 소개",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              maxLines: 20,
              style: Theme.of(context).textTheme.displayMedium,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _addtional() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "추가 정보",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              maxLines: 10,
              style: Theme.of(context).textTheme.displayMedium,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _addImage() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Row(
          children: [
            const Text(
              "사진 첨부",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () => Get.find<ImagePickerController>().pickImages(),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _button() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: InkWell(
          onTap: () {
            Get.find<PromotionController>().createPromotion();
          },
          child: Container(
            width: 400,
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xff713eff),
                borderRadius: BorderRadius.circular(2.0)),
            alignment: Alignment.center,
            child: const Text(
              "홍보 글 등록하기",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );

  Widget _pickedImages() => GetX<ImagePickerController>(builder: (controller) {
        return Padding(
            padding: EdgeInsets.all(
                ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
            child: (controller.webImages.isEmpty && controller.images.isEmpty)
                ? Container(
                    height: 300,
                    color: const Color(0xffbdbdbd),
                    alignment: Alignment.center,
                    child: const Text(
                      "선택한 이미지가 없습니다.",
                      style: TextStyle(color: Colors.white),
                    ))
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          (kIsWeb)
                              ? controller.webImages.length
                              : controller.images.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Stack(
                            children: [
                              Container(
                                  height: 300,
                                  width: 300,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: (kIsWeb)
                                        ? Image.memory(
                                            controller.webImages[index],
                                            fit: BoxFit.fill,
                                          )
                                        : Image.file(
                                            File(controller.images[index].path),
                                            fit: BoxFit.fill,
                                          ),
                                  )),
                              Positioned(
                                left: 2,
                                top: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.find<ImagePickerController>()
                                        .deleteImage(index);
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.7),
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ));
      });
}
