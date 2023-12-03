import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/image_path.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';

enum ProfileType { MYPAGE, ICONACTIVE, ICON }

class ProfileImage extends StatefulWidget {
  final double? length;
  final ProfileType type;
  const ProfileImage({super.key, this.length = 30, required this.type});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      ProfileType.MYPAGE => _buildMyPageImage(),
      ProfileType.ICON => _buildBasic(Colors.white),
      ProfileType.ICONACTIVE => _buildBasic(Theme.of(context).primaryColor),
    };
  }

  Widget _buildMyPageImage() => Container(
      width: widget.length,
      height: widget.length,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
            width: widget.length! - 2.0,
            height: widget.length! - 2.0,
            child: _image()),
      ));

  Widget _buildBasic(Color color) => Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(width: 28, height: 28, child: _image()),
      ));

  Widget _image() => GetX<LoginController>(builder: (controller) {
        final String url = controller.user?.properties?["profile_image"] ?? "";
        if (url == "") {
          return Image.asset(
            ImagePath.basic,
            fit: BoxFit.cover,
          );
        } else {
          return Image.network(
            url,
            fit: BoxFit.cover,
          );
        }
      });
}
