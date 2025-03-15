import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/constant/images.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String backgroundImage;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.backgroundImage = AppImages.screenBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Image.asset(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              backgroundImage ,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: SizedBox()
          ),
          child, // Main content goes on top
        ],
      ),
    );
  }
}