import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<StepScreenProvider>(
      builder: (BuildContext context, stepScreenProvider, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let's Get to Know You", style: textTheme.headlineLarge),
            Text(
              "Share more about yourself to help us tailor your experience",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),
            ),
            SizedBox(height: 16.h,),
            Text("Full Name",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),),
            SizedBox(height: 8.h,),
            TextFormField(decoration: InputDecoration(
              hintText: 'Name',
            ),),
            SizedBox(height: 12.h,),
            Text("Age",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),),
            SizedBox(height: 8.h,),
            GestureDetector(
              onTap: (){
                stepScreenProvider.stepOneModeSelection('age');
              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    border: Border.all(color: Color(0xff1E1E1E).withOpacity(0.12)),
                    borderRadius: BorderRadius.circular(16.r)
                ),
              ),
            ),
            SizedBox(height: 12.h,),
            Text("Preferred Language",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),),
            SizedBox(height: 8.h,),
            GestureDetector(
              onTap: (){
                stepScreenProvider.stepOneModeSelection('language');
              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    border: Border.all(color: Color(0xff1E1E1E).withOpacity(0.12)),
                    borderRadius: BorderRadius.circular(16.r)
                ),
              ),
            ),
          ],
        );
      },);
  }
}
