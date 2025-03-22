import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../../utility/utils.dart';
import '../../../../../view_model/step_screen_provider.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({
    super.key,
    required this.textTheme,
    required List<String> allGender, required this.stepScreenProvider,
  }) : _allGender = allGender;

  final TextTheme textTheme;
  final List<String> _allGender;
  final  StepScreenProvider stepScreenProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                scrollController: FixedExtentScrollController(
                  initialItem: _allGender.indexOf(
                    stepScreenProvider.selectedGender,
                  ) // Initially selected value
                ),
                offAxisFraction: 0,
                magnification: 1.2,
                squeeze: 1.2,
                itemExtent: 50,
                looping: false,
                onSelectedItemChanged: (int index) {
                  stepScreenProvider.genderSelection(_allGender[index]);
                },
                selectionOverlay: Container(
                  color: Colors.transparent,
                ),
                children:
                _allGender.map((age) {
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
        SizedBox(
          width: double.infinity,
          child: Utils.primaryButton(
            title: 'Save',
            context: context,
            padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 18.h),
            onTap: () {
            },
          ),
        ),
      ],
    );
  }
}
