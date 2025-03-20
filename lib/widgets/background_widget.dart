import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/images.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final bool resizeToAvoidBottomInset;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.backgroundImage = AppImages.screenBackground,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        fit: StackFit.expand,
        children: [
         Container(
           width: double.infinity,
           height: double.infinity,
           decoration: BoxDecoration(
             color: Color(0xffF2F0F0),
           ),
         ),
          Positioned(
            right: 110,
            top: -80,
            child: Image.asset(
                AppImages.screenLayer02
            ),
          ),

          Positioned(
            left: 120,
            top: -90,
            child: Image.asset(
                AppImages.screenLayer01
            ),
          ),
          // SingleChildScrollView(
          //   child: Image.asset(
          //     height: ScreenUtil().screenHeight,
          //     width: ScreenUtil().screenWidth,
          //     backgroundImage ,
          //     fit: BoxFit.cover,
          //     alignment: Alignment.center,
          //   ),
          // ),
          // Positioned.fill(
          //   child: SizedBox()
          // ),
          child, // Main content goes on top
        ],
      ),
    );
  }
}