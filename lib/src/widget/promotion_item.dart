import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:intl/intl.dart';

enum PromotionItemtype { LISTITEM, CARD }

class PromotionItem extends StatelessWidget {
  final Promotion promotion;
  final String? date;
  final bool? showDday;
  final PromotionItemtype type;
  const PromotionItem(
      {super.key,
      this.date,
      this.showDday = false,
      required this.promotion,
      this.type = PromotionItemtype.CARD});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case PromotionItemtype.CARD:
        return _buildCardItem();
      case PromotionItemtype.LISTITEM:
        return _buildListTileItem();
    }
  }

  Widget _buildCardItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          _header(),
        ],
      );

  Widget _header() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                promotion.club,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              child: Text(
                promotion.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _image() => Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(4.0),
                  shape: BoxShape.rectangle,
                  color: Colors.grey),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl: promotion.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(top: 20, right: 0, child: _dday())
        ],
      );

  Widget _dday() => (date != null)
      ? Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(color: Color(0xff713eff)),
          child: Text(
            date!,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
      : Container();

  Widget _buildListTileItem() => SizedBox(
        width: 700,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: CachedNetworkImage(
                        imageUrl: promotion.images.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                              promotion.club,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              promotion.title,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text(
                              DateFormat.yMd().format(promotion.closeAt),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 25,
              thickness: 1,
              indent: 2,
              endIndent: 2,
              color: Color.fromARGB(255, 237, 237, 237),
            )
          ],
        ),
      );
}
