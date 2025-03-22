import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../theme/theme/theme_extensions/color_palette.dart';
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: AppColors.secondary,
          backgroundImage: AssetImage(
            'assets/images/person/aunty.png',
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.onPrimary,
            child: Center(
              child: Icon(
                CupertinoIcons.camera,
                color: AppColors.primary,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}