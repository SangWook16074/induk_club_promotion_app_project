import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/constants/image_path.dart';
import 'package:induk_club_promotion_app_project/src/widget/social_image_icon.dart';

class GoogleLoginButton extends StatelessWidget {
  final void Function()? onTap;
  const GoogleLoginButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: SocialImageIcon(path: SocialImagePath.google)),
        ),
      ),
    );
  }
}
