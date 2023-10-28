import 'package:flutter/material.dart';

enum ScreenType { MOBILE, DESKTOP }

class BannerWidget extends StatefulWidget {
  final ScreenType type;
  const BannerWidget({super.key, required this.type});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case ScreenType.MOBILE:
        return _mobile();
      case ScreenType.DESKTOP:
        return _desktop();
    }
  }

  Widget _mobile() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.66,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Widget _desktop() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
