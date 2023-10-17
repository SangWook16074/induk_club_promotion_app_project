import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DesktopMain extends StatefulWidget {
  const DesktopMain({super.key});

  @override
  State<DesktopMain> createState() => _DesktopMainState();
}

class _DesktopMainState extends State<DesktopMain> {
  late ScrollController _verticalController;
  late TextEditingController _searchController;
  int _currentIndex = 0;

  moveToUp() {
    _verticalController.jumpTo(0.0);
  }

  @override
  void initState() {
    _verticalController = ScrollController();
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: _verticalController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _top(),
          _banner(),
          _searchBar(),
          _items(),
        ],
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black)),
            child: Row(
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Text('Menu $index'),
                        ))),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('로그인'),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _banner() {
  //   return Padding(
  //     padding: const EdgeInsets.all(40.0),
  //     child: SizedBox(
  //       width: MediaQuery.of(context).size.width * 0.66,
  //       child: AspectRatio(
  //         aspectRatio: 2.0,
  //         child: Container(
  //           decoration: BoxDecoration(
  //               color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Induk',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'University',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Club Promotions',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SearchTextField(
            controller: _searchController, type: SearchBarType.DESKTOP));
  }

  Widget _items() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color(0x00000000).withOpacity(0.7),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.lock_clock,
                              color: Color(0xffff1122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '마감이 얼마 안남은글',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const PromotionView()));
                            },
                            child: const PromotionItem(
                              title: '동아리 명',
                              discription: '동아리소개내용',
                              date: 'D-9',
                              type: PromotionItemType.DESKTOP,
                            )),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: 5,
                    effect: const ScrollingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: Color(0xff9933ff),
                        activeDotScale: 1.2,
                        spacing: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
