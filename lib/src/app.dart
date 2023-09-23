import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ScrollController _scrollController;
  late TextEditingController _searchController;

  moveToUp() {
    _scrollController.jumpTo(0.0);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: moveToUp,
          child: const Icon(Icons.arrow_upward),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _top(),
              _banner(),
              _searchBar(),
              _items(),
            ],
          ),
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
    return Stack(
      children: [
        Container(
          width: 1000,
          height: 500,
          color: Colors.green,
        ),
        Positioned(
          bottom: 1.0,
          left: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: const Text('동아리 회원 가입'),
            ),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 600,
            height: 42,
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black)),
            child: TextField(
              controller: _searchController,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
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
          (index) => ListTile(
                title: Text('$index'),
              )),
    );
  }
}
