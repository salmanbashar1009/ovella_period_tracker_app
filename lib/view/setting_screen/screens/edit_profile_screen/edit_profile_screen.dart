import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/edit_profile_screen/widget/edit_profile_from.dart';
import 'widget/profile_image_widget.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =Theme.of(context).textTheme;
    ColorScheme colorScheme =Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              children: [

                /// App bar part
                SizedBox(height: 12.h),
                HeaderWidget(title: 'Edit Profile'),
                SizedBox(height: 24.h),

                ///details part
                Container(
                  padding: AppPadding.screenPadding,
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [

                      ///<----- profile image ------>
                      ProfileImageWidget(),
                      SizedBox(height: 12.h,),

                      ///<----- profile Details form
                      EditProfileForm(textTheme: textTheme, colorScheme: colorScheme),
                    ],
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



