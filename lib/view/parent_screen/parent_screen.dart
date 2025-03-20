import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/parent_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/theme/theme_extensions/color_palette.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parentProvider = context.watch<ParentScreenProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: GestureDetector(
        onTap: (){
          debugPrint("\nAi Chat bot\n");
          parentProvider.onSelectedIndex(2);

        },
        child: Container(
          width: 56,
          height: 56,
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xffFFDEE6),
              width: 5
            )
          ),
          child: Center(child: Image.asset("assets/icons/ai-chat-02.png",
          width: 20,
          height: 20,
          fit: BoxFit.cover,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,

      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,

        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                    padding: EdgeInsets.zero,
                  overlayColor: Colors.transparent,
                    shadowColor: Colors.transparent
                ),
               // padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(AppImages.homeIcon,
                  width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                    color: parentProvider.selectedIndex == 0
                        ? AppColors.secondary
                        : AppColors.iconColor,
                  ),
                    Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                        color:
                            parentProvider.selectedIndex == 0
                                ? AppColors.secondary
                                : AppColors.textColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {
                  if(parentProvider.selectedIndex == 0){
                    Utils.scrollToTop(scrollController: context.read<HomeScreenProvider>().homeScreenScrollController);
                  }
                  parentProvider.onSelectedIndex(0);
                },
              ),
            ),
            //Spacer(),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    overlayColor: Colors.transparent,
                    shadowColor: Colors.transparent
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.trackingIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                      color: parentProvider.selectedIndex == 1
                          ? AppColors.secondary
                          : AppColors.iconColor,
                    ),
                    Text(
                      "Tracking",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            parentProvider.selectedIndex == 1
                                ? AppColors.secondary
                                : AppColors.textColor,
                        fontSize: 10.sp,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {
                  parentProvider.onSelectedIndex(1);
                },
              ),
            ),
         //   SizedBox(width: 48), // Empty space for the FAB
            Spacer(),
           // Spacer(),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    overlayColor: Colors.transparent,
                    shadowColor: Colors.transparent
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.communityIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                      color: parentProvider.selectedIndex == 3
                          ? AppColors.secondary
                          : AppColors.iconColor,
                    ),
                    Text(
                      "Community",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            parentProvider.selectedIndex == 3
                                ? AppColors.secondary
                                : AppColors.textColor,
                        fontSize: 10.sp,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {
                  parentProvider.onSelectedIndex(3);
                },
              ),
            ),
           // Spacer(),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                  padding: EdgeInsets.zero,
                    overlayColor: Colors.transparent,
                  shadowColor: Colors.transparent
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.settingsIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                      color: parentProvider.selectedIndex == 4
                          ? AppColors.secondary
                          : AppColors.iconColor,
                    ),
                    Text(
                      "Settings",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            parentProvider.selectedIndex == 4
                                ? AppColors.secondary
                                : AppColors.textColor,
                        fontSize: 10.sp,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                onPressed: () {
                  parentProvider.onSelectedIndex(4);
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: parentProvider.selectedIndex,
            children: parentProvider.parentScreens,
          ),
        ],
      ),
    );
  }
}
