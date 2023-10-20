import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/move_to_up_fab.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';

import '../widget/promotion_item.dart';

class MobileMain extends StatefulWidget {
  const MobileMain({super.key});

  @override
  State<MobileMain> createState() => _MobileMainState();
}

class _MobileMainState extends State<MobileMain> {
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
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color(0xff1e1e1e),
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: AppBar(
              backgroundColor: const Color(0xff1e1e1e).withOpacity(0.7),
            ),
          ),
        ),
      ),
      floatingActionButton: MoveToUpFab(
        onPressed: moveToUp,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/red_white.jpg'))),
        child: SingleChildScrollView(
          controller: _verticalController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              _banner(),
              _searchBar(),
              _items(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Induk',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'University',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Club Promotions',
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 동아리 프로모션 글 검색용 검색바
  Widget _searchBar() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchTextField(
            controller: _searchController, type: SearchBarType.MOBILE));
  }

  // 동아리 프로모션 글
  Widget _items() {
    return Column(
      children: List.generate(
          30,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const PromotionView()));
                    },
                    child: const PromotionItem(
                      title: '동아리 명',
                      discription: '동아리 소개글',
                      date: 'D-9',
                      type: PromotionItemType.MOBILE,
                    )),
              )),
    );
  }
}
