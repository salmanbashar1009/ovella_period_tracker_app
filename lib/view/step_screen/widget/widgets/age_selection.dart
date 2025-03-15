import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../utility/utils.dart';
import '../../../../view_model/step_screen_provider.dart';
class AgeSelection extends StatelessWidget {
  const AgeSelection({
    super.key,
    required this.textTheme,
    required List<int> allAges, required this.stepScreenProvider,
  }) : _allAges = allAges;

  final TextTheme textTheme;
  final List<int> _allAges;
  final  StepScreenProvider stepScreenProvider;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme =Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Your Age", style: textTheme.headlineLarge),
        Stack(
          children: [
            SizedBox(
              height: 302.h,
            ),
            Positioned(
              top: 105.h,
              child: Container(
                height: 54.h,
                width:362.w,
                decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Color(0xff1E1E1E).withOpacity(0.12))
                ),
              ),
            ),
            SizedBox(
              height: 302.h,
              child: CupertinoPicker(
                offAxisFraction: 0,
                magnification: 1.2,
                squeeze: 1.2,
                itemExtent: 50,
                looping: false,
                onSelectedItemChanged: (int index) {
                  stepScreenProvider.ageSelection(_allAges[index]);
                },
                selectionOverlay: Container(
                  color: Colors.transparent,
                ),
                children:
                _allAges.map((age) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                            age.toString(),
                            style: textTheme.bodyMedium
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h,),
        Utils.primaryButton(
          title: 'Next',
          textTheme: textTheme,
          colorScheme: colorScheme,
          onTap: () {
              stepScreenProvider.stepOneModeSelection('language');
          },
        ),
      ],
    );
  }
}
