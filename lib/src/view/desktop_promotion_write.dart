import 'package:flutter/material.dart';

class DesktopPromotionWrite extends StatefulWidget {
  const DesktopPromotionWrite({super.key});

  @override
  State<DesktopPromotionWrite> createState() => _DesktopPromotionWriteState();
}

class _DesktopPromotionWriteState extends State<DesktopPromotionWrite> {
  DateTime _currentTime = DateTime.now();
  DateTime _expirationTime = DateTime.now();

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

  Widget _title() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "글 제목",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
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
                      fontSize: 25,
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
                          "${_currentTime.year}-${_currentTime.month}-${_currentTime.day}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: () async {
                              DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: _currentTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000));
                              setState(() {
                                _currentTime = dateTime!;
                              });
                            },
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
                            onTap: () async {
                              DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: _currentTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000));
                              setState(() {
                                _expirationTime = dateTime!;
                              });
                            },
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

  Widget _requiredPeople() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "모집인원",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _info() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "동아리 소개",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              maxLines: 20,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            )
          ],
        ),
      );

  Widget _addtional() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "추가 정보",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
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
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "사진 첨부",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 300,
                color: const Color(0xff4e4e4e),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 100,
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
}
