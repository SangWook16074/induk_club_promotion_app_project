import 'package:flutter/material.dart';

enum ScreenType { MOBILE, DESKTOP }

class PromotionItem extends StatelessWidget {
  final String? title;
  final String date;
  final ScreenType type;
  const PromotionItem(
      {super.key, this.title = '', required this.date, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ScreenType.MOBILE:
        return _mobileItem();
      case ScreenType.DESKTOP:
        return _desktopItem();
    }
  }

  Widget _mobileItem() {
    return _basic(3);
  }

  Widget _desktopItem() {
    return _basic(2);
  }

  Widget _basic(double ratio) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: ratio,
          child: SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    Text(title!)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 1.0,
          right: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        )
      ],
    );
  }
}
