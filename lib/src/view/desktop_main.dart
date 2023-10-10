import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/login.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class DesktopMain extends StatefulWidget {
  const DesktopMain({super.key});

  @override
  State<DesktopMain> createState() => _DesktopMainState();
}

class _DesktopMainState extends State<DesktopMain> {
  late ScrollController _verticalController;
  late TextEditingController _searchController;

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

    return Scaffold(
        body: Row(
      children: [
        _sideMenu(),
        Expanded(
          flex: 8,
          child: SingleChildScrollView(
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
          ),
        ),
      ],
    ));
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

  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.66,
        child: AspectRatio(
          aspectRatio: 2.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
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
    return CarouselSlider.builder(
        itemCount: 30,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PromotionView()));
                },
                child: const PromotionItem(
                  title: '동아리 명',
                  date: '2023-09-23',
                  type: PromotionItemType.DESKTOP,
                )),
          );
        },
        options: CarouselOptions(
            aspectRatio: 2.5,
            viewportFraction: 0.8,
            enlargeFactor: 0.5,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom));
  }

  Widget _sideMenu() {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Color(0xff2e2e2e),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SignButton(
                  label: 'Sign In',
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login())),
                ),
                const SignButton(label: 'Sign Up'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: Container(
              height: 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  gradient: const LinearGradient(
                      colors: [Color(0xffd6f5ff), Color(0xffe5d6ff)])),
            ),
          ),
        ],
      ),
    );
  }
}
