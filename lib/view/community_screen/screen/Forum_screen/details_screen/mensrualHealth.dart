import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/model/catagoryModel.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class MenstrualHealth extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;

  const MenstrualHealth({
    super.key,
    required this.categories,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCategory = categories[selectedIndex];
    return BackgroundWidget(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //---------App Bar Section ------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        FocusScope.of(context).unfocus();
                      },
                      child: Utils.backButton(context),
                    ),
                    Text(
                      selectedCategory.section,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    SizedBox(width: 30.w), // Adjust as needed
                  ],
                ),

                SizedBox(height: 17.5.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                      top: 8.h,
                      bottom: 12.h,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: Image.asset(
                            selectedCategory.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          selectedCategory.discription,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                        ),
                      ],
                    ),
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
