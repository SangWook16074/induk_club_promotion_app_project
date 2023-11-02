import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobileMyPage extends StatelessWidget {
  const MobileMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          _clubInfo(),
          _myPromotions(),
        ],
      ),
    ));
  }

  Widget _clubInfo() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleBox(label: '동아리 소개', fontSize: 20),
                  Text(
                    '수정',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: const Color(0xffe0e0e0),
                    border: Border.all(color: const Color(0xffb5b5b5)),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Text('동아리명'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [Text('A&I')],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Text('동아리개설일'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [Text('2023년 1월 10일')],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Text('동아리분류'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [Text('교내스터디')],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _myPromotions() => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleBox(label: '내가 쓴 글', fontSize: 20),
                Icon(
                  Icons.edit,
                  color: Color(0xff713eff),
                )
              ],
            ),
          ),
          ...List.generate(
            20,
            (index) => _items(),
          )
          // _noItem(),
        ],
      );

  Widget _items() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xffe0e0e0),
            border: Border.all(color: const Color(0xffb5b5b5)),
          ),
          child: const Text("A&I 신규 동아리원 모집합니다."),
        ),
      );
  Widget _noItem() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 100,
        child: const Text("작성한 글이 없습니다"),
      );
}
