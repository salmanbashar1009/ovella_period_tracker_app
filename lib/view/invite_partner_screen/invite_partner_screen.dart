import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/invite_partner_screen/cards/journey_together_card/journey_together_card.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class InvitePartnerScreen extends StatelessWidget {
  const InvitePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Utils.backButton(context),
                SizedBox(height: 16.h),
                JourneyTogetherCard(),
                SizedBox(height: 16.h),
                Text("What Yor Partner Gets", style: textTheme.headlineSmall),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 186.h,
                              width: 255.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "Confidence In Parenthood.",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      );
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
