import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/localization_provider.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../utility/utils.dart';
import '../../../view_model/step_screen_provider.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({
    super.key,
    required this.textTheme,
    required this.stepScreenProvider,
    required this.allLanguages,
  });

  final TextTheme textTheme;
  final List<Map<String,String>> allLanguages;
  final StepScreenProvider stepScreenProvider;

  @override
  Widget build(BuildContext context) {



    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Your Language", style: textTheme.headlineLarge),
        Stack(
          children: [
            SizedBox(height: 302.h),
            Positioned(
              top: 105.h,
              child: Container(
                height: 54.h,
                width: 362.w,
                decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Color(0xff1E1E1E).withOpacity(0.12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 302.h,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: allLanguages.indexOf(
                    stepScreenProvider.selectedLanguage,
                  ), // Initially selected value
                ),
                offAxisFraction: 0,
                magnification: 1.2,
                squeeze: 1.2,
                itemExtent: 50,
                looping: false,
                onSelectedItemChanged: (int index) {
                  stepScreenProvider.languageSelection(allLanguages[index]);
                },
                selectionOverlay: Container(color: Colors.transparent),
                children:
                    allLanguages.map((language) {
                      return Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(language['name']!, style: textTheme.bodyMedium),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          child: Utils.primaryButton(
            title: 'Continue',
            context: context,
            padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 18.h),
            onTap: () {
              stepScreenProvider.updatePage(stepScreenProvider.currentIndex + 1);
              Provider.of<LocalizationProvider>(context,listen: false).setLocale(Locale(stepScreenProvider.selectedLanguage['code']!));
            },
          ),
        ),
      ],
    );
  }
}
