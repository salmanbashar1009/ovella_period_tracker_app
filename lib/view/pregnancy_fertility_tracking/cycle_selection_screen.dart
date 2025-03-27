import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../theme/theme/theme_extensions/color_palette.dart';
import '../../utility/utils.dart';
import '../../view_model/step_screen_provider.dart';

class CycleSelectionScreen extends StatelessWidget {
  const CycleSelectionScreen({
    super.key,
    required List<int> allCycleLength,
    required this.stepScreenProvider,
  }) : _allCycleLength = allCycleLength;
  final List<int> _allCycleLength;
  final StepScreenProvider stepScreenProvider;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h,),
                Text("Select Your Cycle Length", style: textTheme.headlineLarge),
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
                          initialItem: _allCycleLength.indexOf(
                            stepScreenProvider.selectedCycleLength,
                          ), // Initially selected value
                        ),
                        offAxisFraction: 0,
                        magnification: 1.2,
                        squeeze: 1.2,
                        itemExtent: 50,
                        looping: false,
                        onSelectedItemChanged: (int index) {
                          stepScreenProvider.cycleLengthSelection(_allCycleLength[index]);
                        },
                        selectionOverlay: Container(color: Colors.transparent),
                        children:
                            _allCycleLength.map((age) {
                              return Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: textTheme.bodyMedium,
                                    ),
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
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
