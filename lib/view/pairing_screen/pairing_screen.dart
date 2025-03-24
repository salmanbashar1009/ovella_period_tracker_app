import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/pairing_screen/cards/invitation_sent_card.dart';
import 'package:ovella_period_tracker_app/view/pairing_screen/cards/pairing_code_card.dart';
import '../../widgets/background_widget.dart';

class PairingScreen extends StatelessWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Utils.backButton(context),
                SizedBox(height: 16.h),

                /// < ------ invitation sent card ------------->
                InvitationSentCard(),
                SizedBox(height: 16.h),

                /// <------- Generating pairing card & send Pairing Code Button ----------->
                PairingCodeCard(),
                SizedBox(height: 12.h),

                /// <---------- Cancel invitation button--------->
                SizedBox(
                  width: double.infinity,
                  child: Utils.primaryButton(
                    title: 'Cancel Invitation',
                    onTap: () {
                      showCustomBottomSheet(context);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                    context: context,
                    color: AppColors.onPrimary,
                    textStyle: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    borderColor: Color(0xff1e1e1e1f).withOpacity(0.12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows customization of sheet height
      builder: (BuildContext context) {
        return Container(
          height: 448.h,
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(color: AppColors.onPrimary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r),topRight: Radius.circular(24.r))
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 24.h,
                    backgroundColor: Color(0xffF4F6F6),
                    child: Image.asset(AppImages.cancelIcon),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              Image.asset('assets/images/pairing_screen/ask_image.png'),
              SizedBox(height: 12.h),

              Text(
                'Are You Sure You Want To\nStop Sharing',
                style: textTheme.headlineSmall!.copyWith(fontSize: 18.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h,),

              Text(
                'Your partner won’t see content\nfrom your profile',
                style: textTheme.bodySmall!.copyWith(fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              SizedBox(
                width: double.infinity,
                child: Utils.primaryButton(
                  title: 'Yes Stop Sharing',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                  context: context,
                  borderColor: Color(0xff1e1e1e1f).withOpacity(0.12),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: Utils.primaryButton(
                  title: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                  context: context,
                  color: AppColors.onPrimary,
                  textStyle: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  borderColor: Color(0xff1e1e1e1f).withOpacity(0.12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
