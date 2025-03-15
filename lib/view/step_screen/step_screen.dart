import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import '../../theme/constant/images.dart';
import 'widget/header_widget.dart';

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BackgroundWidget(
      child: Consumer<StepScreenProvider>(
        builder: (BuildContext context, stepScreenProvider, Widget? child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    HeaderWidget(textTheme: textTheme),

                    // Page Indicator Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        stepScreenProvider.carouselItems.length,
                        (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            width: 116.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              color:
                                  stepScreenProvider.currentIndex == index
                                      ? colorScheme.secondary
                                      : Color(0xff1E1E1E).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    // PageView Carousel
                    Expanded(
                      child: PageView.builder(
                        controller: stepScreenProvider.pageController,
                        itemCount: stepScreenProvider.carouselItems.length,
                        onPageChanged: (index) {
                          stepScreenProvider.updateIndex(index);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return stepScreenProvider.carouselItems[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
