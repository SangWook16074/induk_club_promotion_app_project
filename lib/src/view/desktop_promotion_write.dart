import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DesktopPromotionWrite extends StatefulWidget {
  const DesktopPromotionWrite({super.key});

  @override
  State<DesktopPromotionWrite> createState() => _DesktopPromotionWriteState();
}

class _DesktopPromotionWriteState extends State<DesktopPromotionWrite> {
  final DateTime _currentTime = DateTime.now();
  DateTime _beginTime = DateTime.now();
  DateTime _expirationTime = DateTime.now();
  final List<XFile> _images = [];
  final List<Uint8List> _webImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    if (kIsWeb) {
      picker.pickImage(source: ImageSource.gallery).then((XFile? image) {
        if (image != null) {
          image.readAsBytes().then((memory) => setState(() {
                _webImages.add(memory);
              }));
        }
      });
    } else {
      picker.pickImage(source: ImageSource.gallery).then((XFile? image) {
        if (image != null) {
          setState(() {
            _images.add(image);
          });
        }
      });
    }
  }

  Future<void> _setBegin() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _currentTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    setState(() {
      _beginTime = dateTime!;
    });
  }

  Future<void> _setExpiration() async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _currentTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    setState(() {
      _expirationTime = dateTime!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 300),
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
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "동아리",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextSpan(
                      text: "홍보글",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff713eff))),
                  TextSpan(
                    text: "을 작성하세요.",
                    style: TextStyle(
                        fontSize: 45,
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
        padding: const EdgeInsets.all(20.0),
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
        padding: const EdgeInsets.all(20.0),
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
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${_beginTime.year}-${_beginTime.month}-${_beginTime.day}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: _setBegin,
                            child: const Icon(Icons.calendar_today)),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${_expirationTime.year}-${_expirationTime.month}-${_expirationTime.day}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: _setExpiration,
                            child: const Icon(Icons.calendar_today)),
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
        padding: const EdgeInsets.all(20.0),
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
        padding: const EdgeInsets.all(20.0),
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
        padding: const EdgeInsets.all(20.0),
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
        padding: const EdgeInsets.all(20.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: _pickImages,
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
        padding: const EdgeInsets.symmetric(vertical: 100),
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
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
      );

  Widget _pickedImages() => (_webImages.isEmpty && _images.isEmpty)
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
                (kIsWeb) ? _webImages.length : _images.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: (kIsWeb)
                          ? Image.memory(_webImages[index])
                          : Image.file(
                              File(_images[index].path),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (kIsWeb) {
                              _webImages.removeAt(index);
                            } else {
                              _images.removeAt(index);
                            }
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
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
}
