import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/gender_selection_widget/gender_selection_widget.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/step_screen_provider.dart';

class SelectGenderScreen extends StatelessWidget {
  const SelectGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  HeaderWidget(title: 'Select Your Age'),
                  Consumer<StepScreenProvider>(
                    builder: (_, stepScreenProvider, _) {
                      return GenderSelection(
                        textTheme: textTheme,
                        allGender: stepScreenProvider.allGender,
                        stepScreenProvider: stepScreenProvider,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
