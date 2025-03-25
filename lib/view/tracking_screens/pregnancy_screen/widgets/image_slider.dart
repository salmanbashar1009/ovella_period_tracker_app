import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/pregnancy_screen_provider.dart';
import 'package:provider/provider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController carouselController =
        CarouselSliderController();
    return Stack(
      children: [
        Consumer<PregnancyScreenProvider>(
          builder: (context,pregnancyScreenProvider,child) {
            return CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 200.h,
                viewportFraction: 1,
                initialPage: 0,
              ),

              items:
                  pregnancyScreenProvider.imagePath.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(

                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:AppColors.sliderBGColor,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(imagePath),
                                onError: (_,_){
                                   Icon(Icons.image);
                                }
                              )
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            );
          }
        ),

        Center(
          child: SizedBox(
            height: 200.h,
            width: MediaQuery.of(context).size.width * 0.58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPositionedNavigation(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: () {
                    carouselController.previousPage();
                  },
                ),
                buildPositionedNavigation(
                  icon: Icons.arrow_forward_ios_rounded,
                  onTap: () {
                    carouselController.nextPage();
                  },
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget buildPositionedNavigation({
    // required double position,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: AppColors.onPrimary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.textColor.withOpacity(0.12)),
        ),
        child: Icon(icon, size: 16.r),
      ),
    );
  }
}

class SliderDetailsButton extends StatelessWidget {
  const SliderDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width > 750 ? 120.w : 130,
      height: 40.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.pregnancyDetailsScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          elevation: 0,
          shadowColor: null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Details",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.onPrimary,
              size: 16.r,
            ),
          ],
        ),
      ),
    );
  }
}
