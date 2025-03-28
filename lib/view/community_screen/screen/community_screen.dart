// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/event_screen/event_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/forum_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/group_screen/group_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/inputDecoration.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/segment_button.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/view_model/community_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommunityScreen extends StatelessWidget {
       

  CommunityScreen({super.key});
  
  static const List<String> _titles = [
    
    "Forum", "Groups", "Events"];
  static const List<String> _appBarTitles = [
    "Community",
    "Groups",
    "Events & Workshops",
  ];
  static const List<String> _searchPlaceholders = [
    "Find topics",
    "Find topics and discussions",
    "Find groups",
  ];
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

      final appLocalization = AppLocalizations.of(context);
       List<String> titles = [
      appLocalization?.forum ?? "Forum",
      appLocalization?.groups ?? "Groups",
      appLocalization?.events ?? "Events"
    ];
       List<String> appBarTitles = [
      appLocalization?.community ?? "Community",
      appLocalization?.groups ?? "Groups",
      appLocalization?.eventsworkshops ?? "Events & Workshops"
    ];


 


    return BackgroundWidget(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<CommunityProvider>(
            builder: (context, provider, child) {
              String currentAppBarTitle =
                  appBarTitles[provider.selectedIndex];
              String currentSearchPlaceholder =
                  _searchPlaceholders[provider.selectedIndex];
          
              return Column(
                children: [
                  Padding(
                  padding: AppPadding.screenHorizontalPadding,

                    child: AppBar(
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      leading: ClipOval(
                        child: Image.asset(
                          "assets/images/person/aunty.png",
                          height: 48.h,
                          width: 48.w,
                        ),
                      ),
                      title: Text(
                        currentAppBarTitle,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      centerTitle: true,
                      actions: [
                        Utils.circleContainer(
                          imagePath: "assets/images/icons/bell.png",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21.5.sp),
          
                  // Show subtitle section only for Forum (index 0)
                  if (provider.selectedIndex == 0) ...[
                    //---------Sub title section----------------------------------
                    Padding(
                                  padding: AppPadding.screenHorizontalPadding,

                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          appLocalization!.heyjaneDoe,
                              // "Hey Jane Doe, Welcome to the",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ovella ${appLocalization.forum}", 
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(
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
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(
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
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                  ] else
                    SizedBox(height: 28.h),
          
                  Padding(
                                padding: AppPadding.screenHorizontalPadding,

                    child: CustomSegmentedControl(options: titles)),
                  SizedBox(height: 16.h),
          
                  //-----------search-------------------------------------------------------
                  Padding(
                                padding: AppPadding.screenHorizontalPadding,

                    child: TextFormField(
                      onTapOutside: (_) {
                        _focusNode.unfocus();
                      },
                      focusNode: _focusNode,
                      decoration: inputDecoration(
                        context,
                        currentSearchPlaceholder,
                        null,
                        Icon(Icons.search),
                        120.0,
                      ),
                    ),
                  ),
          
                  SizedBox(height: 24.h),
          
                  if (provider.selectedIndex == 0)
                    SizedBox(child: ForumScreen())
                  else if (provider.selectedIndex == 1)
                    SizedBox(child: GroupScreen())
                  else
                    SizedBox(child: EventScreen()),
          
                  SizedBox(height: 24.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
