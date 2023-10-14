import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/gradient_divider.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

import '../login.dart';

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
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/decoration.png'))),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
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
                  discription: '동아리소개내용',
                  date: 'D-9',
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
        color: Color(0xff1e1e1e),
      ),
      child: Column(
        children: [
          _menuHeader(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SignButton(
              label: 'Login',
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Login())),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              child: GradientDivider()),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SideMenuItem(
                label: '메인화면',
                icon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.white,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SideMenuItem(
                label: '동아리 홍보글',
                icon: Icon(
                  Icons.menu_book,
                  size: 40,
                  color: Colors.white,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SideMenuItem(
                label: '마이페이지',
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Widget _menuHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '로그인이 필요합니다.',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
