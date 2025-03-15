import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/on_boarding_screen/widgets/on_boarding_points.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

import '../../theme/constant/images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Image.asset(AppImages.onBoardingCover,fit: BoxFit.cover,),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Your Cycle, Your Fertility, Your Way",
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12),
                  OnBoardingPoints(
                    pointTitle: 'Smart Cycle & Ovulation Tracking',
                  ),
                  OnBoardingPoints(
                    pointTitle: 'AI Health Assistant for Women’s Fertility',
                  ),
                  OnBoardingPoints(
                    pointTitle: 'Fertility Insights & Conception Planning',
                  ),
                  OnBoardingPoints(
                    pointTitle: 'Pregnancy Tracking & Support',
                  ),
                  OnBoardingPoints(pointTitle: 'Mental Well-being Guidance'),
                  OnBoardingPoints(
                    pointTitle: 'Accessible & Affordable Reproductive Care',
                  ),
                  SizedBox(height: 24),
                  Utils.primaryButton(
                    title: 'Get Started',
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.stepScreen);
                    },
                  ),

                  SizedBox(height: 12.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            // Ensure text is visible
                            fontSize: 16,
                            color:
                                Colors.black, // Change color based on theme
                          ),
                        ),
                        TextSpan(
                          text: 'Login here',
                          style: TextStyle(
                            // Ensure text is visible
                            fontSize: 16,
                            color:
                                colorScheme
                                    .secondary, // Change color based on theme
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
