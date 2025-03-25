import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/tailored_wellness_journey_widget/tips_container.dart';

class WellnessTipsList extends StatelessWidget{
  const WellnessTipsList({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, index){
        return TipsContainer(
          title: "Personalized Wellness Tips",
          index: index,
          bodyText: "AI-driven diet, workout, and wellness tips tailored for your cycle or maternity.",
          imagePath:  (index+1)%2 !=0 ?  AppImages.wellnessWoman : AppImages.wellnessWoman02,
          isFromSeeAllList: false,
          listLength: 5,
          reactAmount: (103+index*2),
          //width: ,
        );
        }
    );
  }
}