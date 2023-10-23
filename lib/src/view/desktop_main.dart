import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/basic_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/logo.dart';
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: _verticalController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _banner(),
          _searchBar(),
          _items(),
        ],
      ),
    );
  }

  Widget _banner() {
    return const Padding(padding: EdgeInsets.all(100.0), child: Logo());
  }

  Widget _searchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SearchTextField(
            controller: _searchController, type: SearchBarType.DESKTOP));
  }

  Widget _items() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25.0),
      child: BasicBox(
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
    );
  }
}
