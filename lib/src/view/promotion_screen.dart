import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/date.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/model/promotion.dart';

class PromotionScreen extends StatefulWidget {
  final Promotion promotion;
  const PromotionScreen({super.key, required this.promotion});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  final EdgeInsetsGeometry _mobilePadding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5);
  final EdgeInsetsGeometry _desktopPadding =
      const EdgeInsets.symmetric(horizontal: 40, vertical: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff731eff),
        backgroundColor: Colors.white,
        title: Text('LOGO', style: Get.textTheme.displayLarge),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: (ResponsibleLayout.isDesktop(context))
                  ? const EdgeInsets.only(left: 200, right: 400)
                  : const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  _img(),
                  _title(),
                  _closeAt(),
                  _beginToEnd(),
                  _object(),
                  _content(),
                  _contentOfAcivity(),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          (ResponsibleLayout.isDesktop(context))
              ? Positioned(right: 100, child: _infoBox())
              : Align(alignment: Alignment.bottomCenter, child: _join())
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
        padding: (ResponsibleLayout.isDesktop(context))
            ? _desktopPadding
            : _mobilePadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(widget.promotion.title,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600))),
              ],
            ),
            const Divider(
              color: Color(0xffE6E6E6),
            )
          ],
        ));
  }

  Widget _img() {
    return Padding(
      padding: (ResponsibleLayout.isDesktop(context))
          ? const EdgeInsets.symmetric(
              horizontal: 40,
            )
          : const EdgeInsets.all(8.0),
      child: SizedBox(
        child: CarouselSlider.builder(
            itemCount: widget.promotion.images.length,
            itemBuilder: (context, index, realIndex) => SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.promotion.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 1.5,
              autoPlay: true,
            )),
      ),
    );
  }

  Widget _closeAt() {
    return Padding(
        padding: (ResponsibleLayout.isDesktop(context))
            ? _desktopPadding
            : _mobilePadding,
        child: SizedBox(
          child: Column(
            children: [
              const Row(
                children: [
                  TitleBox(
                    label: '모집마감',
                    fontSize: 18,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    DateFormatWidget(
                      promotion: widget.promotion,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _object() {
    return Padding(
      padding: (ResponsibleLayout.isDesktop(context))
          ? _desktopPadding
          : _mobilePadding,
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '모집인원', fontSize: 18)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text('${widget.promotion.requiredPeople}명',
                    style: Get.textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: (ResponsibleLayout.isDesktop(context))
          ? _desktopPadding
          : _mobilePadding,
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '동아리소개', fontSize: 18)],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Text(widget.promotion.content,
                        style: Get.textTheme.bodyMedium),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _contentOfAcivity() {
    return Padding(
      padding: (ResponsibleLayout.isDesktop(context))
          ? _desktopPadding
          : _mobilePadding,
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '활동내용', fontSize: 18)],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Text(widget.promotion.contentOfActivity,
                        style: Get.textTheme.bodyMedium),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _beginToEnd() {
    return Padding(
      padding: (ResponsibleLayout.isDesktop(context))
          ? _desktopPadding
          : _mobilePadding,
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '활동기간', fontSize: 18)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                DateFormatWidget(
                  promotion: widget.promotion,
                  type: DateType.DateBeginEnd,
                  fontSize: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffE6E6E6),
                    Color(0xffE6E6E6),
                  ]),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: const Offset(0, 200), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'A&I',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color(0xff713eff),
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xff713eff),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('동아리 개설일', style: Get.textTheme.headlineMedium)
                      ],
                    ),
                    Row(
                      children: [
                        Text('2023년 1월 10일', style: Get.textTheme.bodyMedium)
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '동아리 분류',
                          style: Get.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '교내동아리',
                          style: Get.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
                const Row(children: [
                  Expanded(
                    child: SignButton(
                      width: double.infinity,
                      height: 55,
                      child: Text(
                        '지원하기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _join() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      height: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            ...List.generate(
                10, (index) => Colors.white.withOpacity(index * 0.1)),
            ...List.generate(10, (index) => Colors.white)
          ])),
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff713eff)),
              onPressed: () {},
              child: const Text(
                "지원하기",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ))),
    );
  }
}
