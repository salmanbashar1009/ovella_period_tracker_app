import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/section_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/week_list.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/screen_header.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class PregnancyDetailScreen extends StatelessWidget {
  const PregnancyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: AppPadding.screenHorizontalPadding,
                child: ScreenHeader(
                  title: "Weekly",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      WeekList(),

                      Padding(
                        padding: AppPadding.screenPadding,
                        child: imageContainer(context: context, imagePath: "assets/images/pregnancy/baby.png"),
                      ),

                      ///image comparison field
                      // Padding(
                      //   padding: AppPadding.screenPadding,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       imageContainer(
                      //         context: context,
                      //         imagePath: "assets/images/pregnancy/baby.png",
                      //       ),
                      //       imageContainer(
                      //         context: context,
                      //         imagePath: "assets/images/pregnancy/apple.png",
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 10.h),
                      // Replace ListView.builder with a Column
                      Column(
                        children: List.generate(5, (index) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.r),
                            margin: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.onPrimary,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SectionHeader(
                                  title: "Your Baby at 12 weeks Pregnant",
                                ),
                                Text(
                                  '''Length: Around 5.1 cm (2.1 inch) Weight: Around 58 gm Size comparison: About the size of a lime All measurements are approximate and vary within the normal range''',
                                  maxLines: 10,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(fontSize: 13.sp),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageContainer({required BuildContext context, required String imagePath}) {
    return GestureDetector(
      onTap: (){
        // _showFullScreenImage(context, imagePath);
      },
      child: Container(
        width: 360.w,
        height: 245.h,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: Color(0xFFF2DFD4),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.onPrimary),
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
