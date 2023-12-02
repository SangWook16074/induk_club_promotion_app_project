import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/social_image_icon.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(4.0)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: SocialImageIcon(path: SocialImagePath.apple)),
      ),
    );
  }
}
