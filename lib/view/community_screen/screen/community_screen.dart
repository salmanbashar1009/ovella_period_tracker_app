import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/event_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/forum_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/group_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/inputDecoration.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/segment_button.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/view_model/community_provider.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  SizedBox(height: 22.h),

                  //---------appbar section ------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/community/black3.jpeg",
                          height: 48.h,
                          width: 48.w,
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Text(
                          "Community",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ),
                      Spacer(),
                      Utils.circleContainer(
                        imagePath: "assets/images/icons/bell.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 21.5.sp),

                  //---------Sub title section----------------------------------
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Hey Jane Doe, Welcome to the",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ovella community",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  //-------------sub sub title ---------------------------------------------
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Join discussions, ask questions, and",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "connect with experts!",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Segmented Control for Switching Screens
                  CustomSegmentedControl(
                    options: ["Forum", "Groups", "Events"],
                  ),
                  SizedBox(height: 16.h),

                  //-----------search-------------------------------------------------------
                  TextFormField(
                    decoration: inputDecoration(
                      context,
                      "Find topics, groups, and discussions",
                      null,
                      Icon(Icons.search),
                      120.0,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Dynamically Show the Selected Screen
                  Consumer<CommunityProvider>(
                    builder: (context, provider, child) {
                      if (provider.selectedIndex == 0) {
                        return SizedBox(child: ForumScreen());
                      } else if (provider.selectedIndex == 1) {
                        return SizedBox(height: 400.h, child: GroupScreen());
                      } else {
                        return SizedBox(height: 300.h, child: EventScreen());
                      }
                    },
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
