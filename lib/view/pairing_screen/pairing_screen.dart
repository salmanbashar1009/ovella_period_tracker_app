import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                InvitationSentCard(),
                SizedBox(height: 16.h),
                PairingCodeCard(),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: Utils.primaryButton(
                    title: 'Send Invite',
                    onTap: () {},
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                    context: context,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  child: Utils.primaryButton(
                    title: 'Send Invite',
                    onTap: () {},
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                    context: context,
                    color: AppColors.onPrimary,
                    textStyle: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    borderColor: Color(0xff1E1E1E1F).withOpacity(0.12),
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
