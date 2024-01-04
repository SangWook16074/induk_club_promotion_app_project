import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

class ClubItem extends StatelessWidget {
  final Promotion promotion;
  const ClubItem({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(4.0),
                shape: BoxShape.rectangle,
                color: Colors.red),
            height: 300,
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                promotion.club,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      );
}
