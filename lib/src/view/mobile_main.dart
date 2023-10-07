import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_view.dart';

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
        backgroundColor: Color(0xffefcabe),
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: moveToUp,
        child: const Icon(Icons.arrow_upward),
      ),
      body: SingleChildScrollView(
        controller: _verticalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _banner(),
            _searchBar(),
            _items(),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
            alignment: Alignment.center,
            child: TextField(
              controller: _searchController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  hintText: '동아리 정보를 입력하세요.',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  suffixIcon: Icon(Icons.close),
                  suffixIconColor: Colors.black,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

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
                      date: '2023-09-23',
                      type: ScreenType.MOBILE,
                    )),
              )),
    );
  }
}
