import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/image_picker_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_write_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/zoom_image.dart';

import '../constants/status.dart';

class PromotionWrite extends StatefulWidget {
  const PromotionWrite({super.key});

  @override
  State<PromotionWrite> createState() => _PromotionWriteState();
}

class _PromotionWriteState extends State<PromotionWrite> {
  final controller = Get.find<PromotionWriteController>();

  Future<void> _setBegin() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    controller.setAcitivityBegin(dateTime);
  }

  Future<void> _setExpiration() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    controller.setAcitivityEnd(dateTime);
  }

  Future<void> _setRecruitmentBegin() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    controller.setRecruitmentBegin(dateTime);
  }

  Future<void> _setRecruitmentEnd() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    controller.setRecruitmentEnd(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: _appBar(),
        body: SafeArea(
          child: GetX<PromotionWriteController>(builder: (controller) {
            return (controller.status == Status.LOADED)
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              (ResponsibleLayout.isMobile(context)) ? 0 : 300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _title(),
                          _activityPeriod(),
                          _recruitmentPeriod(),
                          _requiredPeople(),
                          _info(),
                          _addtional(),
                          _url(),
                          _addImage(),
                          _pickedImages(),
                          _button(),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          }),
        ),
      ),
    );
  }

  Widget _title() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "제목",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 1,
              controller: controller.title,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  hintText: '제목',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
            ),
          ],
        ),
      );

  Widget _activityPeriod() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "활동기간",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${controller.activityBegin.year}-${controller.activityBegin.month}-${controller.activityBegin.day}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: _setBegin,
                                  child: const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff707070),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('~'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${controller.activityEnd.year}-${controller.activityEnd.month}-${controller.activityEnd.day}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: _setExpiration,
                                  child: const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff707070),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "모집인원",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 1,
              controller: controller.requiredPeople,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  hintText: 'X명',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "동아리 소개",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 10,
              controller: controller.content,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "동아리 활동내용",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 5,
              controller: controller.additional,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
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
              '사진 첨부',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () => Get.find<ImagePickerController>().pickImages(),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      border:
                          Border.all(color: const Color(0xffA7A7A7), width: 1)),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff707070),
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _button() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: InkWell(
          onTap: () {
            controller.showUploadDialog();
          },
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: const Color(0xff713eff),
                borderRadius: BorderRadius.circular(8.0)),
            alignment: Alignment.center,
            child: const Text(
              "홍보 글 등록",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );

  Widget _pickedImages() => GetX<ImagePickerController>(builder: (controller) {
        return (controller.webImages.isEmpty && controller.images.isEmpty)
            ? Container(
                height: 250,
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
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: GestureDetector(
                                onTap: () {
                                  if (kIsWeb) {
                                    Get.to(() => ZoomImage(
                                          tag: index.toString(),
                                          webImage: controller.webImages[index],
                                        ));
                                  } else {
                                    Get.to(() => ZoomImage(
                                        tag: index.toString(),
                                        image: File(
                                          controller.images[index].path,
                                        )));
                                  }
                                },
                                child: Hero(
                                  tag: index.toString(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: (kIsWeb)
                                        ? Image.memory(
                                            controller.webImages[index],
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            File(controller.images[index].path),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
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
              );
      });

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: controller.showCancelDialog,
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      title: const Text(
        '동아리 홍보 글쓰기',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Widget _url() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "지원양식 링크 첨부",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 1,
              controller: controller.url,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                  hintText: 'http://example.com',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffA7A7A7)))),
            ),
          ],
        ),
      );

  Widget _recruitmentPeriod() => Padding(
        padding:
            EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8.0 : 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "모집기간",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${controller.recruitmentBegin.year}-${controller.recruitmentBegin.month}-${controller.recruitmentBegin.day}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: _setRecruitmentBegin,
                                  child: const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff707070),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('~'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${controller.recruitmentEnd.year}-${controller.recruitmentEnd.month}-${controller.recruitmentEnd.day}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                  onTap: _setRecruitmentEnd,
                                  child: const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff707070),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
