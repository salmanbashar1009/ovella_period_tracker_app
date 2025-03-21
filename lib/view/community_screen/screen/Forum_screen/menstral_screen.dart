import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/listviewbuilder.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class MenstralScreen extends StatelessWidget {
  const MenstralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //---------appbar section ------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Utils.backButton(context),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Menstrual health",
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
                    Text("        "), //paknami korle mair
                  ],
                ),

                SizedBox(height: 17.5.sp),

                CategoryList(
                  size: 750,
                  val: 16,
                  scrollDirection: Axis.vertical,
                  categories: categories1,
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
