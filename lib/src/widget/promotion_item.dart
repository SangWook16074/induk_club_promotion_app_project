import 'package:flutter/material.dart';

class PromotionItem extends StatelessWidget {
  final String? title;
  final String date;
  const PromotionItem({super.key, this.title = '', required this.date});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          width: size.width / 2,
          child: AspectRatio(
            aspectRatio: 6.0,
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
            child: Text(date),
          ),
        )
      ],
    );
  }
}
