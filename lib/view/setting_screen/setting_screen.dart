import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              children: [
                Container(
                  padding: AppPadding.screenPadding,
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://www.shutterstock.com/image-photo/studio-shot-red-haired-young-260nw-793320274.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Jane Doe',
                        style: textTheme.headlineSmall!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('janedoe@email.com', style: textTheme.bodySmall),
                      SizedBox(
                        width: double.infinity,
                        child: Utils.primaryButton(
                          title: 'Edit Profile',
                          context: context,
                          color: colorScheme.onPrimary,
                          textColor: colorScheme.primary,
                          onTap: (){

                          },
                        ),
                      ),
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
