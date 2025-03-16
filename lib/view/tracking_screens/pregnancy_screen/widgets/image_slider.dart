import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.h,
            viewportFraction: 1,
            initialPage: 0,
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFDE7E7),
                      ),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        buildPositionedNavigation(position:  45.w,icon:  Icons.arrow_back_ios_rounded),
        buildPositionedNavigation(position:  245.w,icon:  Icons.arrow_forward_ios_rounded),
      ],
    );
  }

  Positioned buildPositionedNavigation({required double position, required IconData icon}) {
    return Positioned(
        bottom: 80.h,
        left: position,
        child: Container(
            width: 32.w,
            height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.textColor.withOpacity(0.12))
          ),
          child: Icon(icon,size: 16.r,),
        ),
      );
  }
}


class SliderDetailsButton extends StatelessWidget {
  const SliderDetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, RouteName.pregnancyDetailsScreen);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            elevation: 0,
            shadowColor: null
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Details",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w400
            ),),
            SizedBox(width: 6.w,),
            Icon(Icons.arrow_forward_ios_rounded,color: AppColors.onPrimary,size: 16.r,)
          ],
        ),
      ),
    );
  }
}
