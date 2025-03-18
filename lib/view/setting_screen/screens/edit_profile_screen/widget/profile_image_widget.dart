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
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D',
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