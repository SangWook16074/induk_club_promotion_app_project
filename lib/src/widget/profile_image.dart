import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double? length;
  final String url;
  const ProfileImage(
      {super.key, this.length = 30, required this.url, required type});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: length,
        height: length,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: length! - 2.0,
            height: length! - 2.0,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
