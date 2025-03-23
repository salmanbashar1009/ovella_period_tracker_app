import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/invite_partner_screen/cards/FAQ_card/FAQ_card.dart';
import 'package:ovella_period_tracker_app/view/invite_partner_screen/cards/step_card/step_card.dart';
import '../../constant/padding.dart';
import '../../utility/utils.dart';
import '../../widgets/background_widget.dart';
import 'cards/journey_together_card/journey_together_card.dart';
import 'cards/invite_partner_theme_card/invite_partner_theme_card.dart';
import 'cards/what_your_partner_get/what_your_partner_get.dart';

class InvitePartnerScreen extends StatelessWidget {
  const InvitePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///<---------Appbar back Button ------->
                  SizedBox(height: 12.h),
                  Utils.backButton(context),
                  SizedBox(height: 16.h),

                  ///<----------Journey Together card ---------->
                  JourneyTogetherCard(),
                  SizedBox(height: 16.h),

                  ///<----------- What get from your partner card --------->
                  Text(
                    "What Your Partner Gets",
                    style: textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return WhatYourPartnerGets(
                          image: "assets/images/setting_screen/Frame 280.png",
                          title: "Confidence In Parenthood.",
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),

                  ///<--------------Track Every Stage Together Card----------->
                  InvitePartnerScreenThemeCard(
                    image:
                        'assets/images/invite_partner_screen/track_every_stage_together.png',
                    title: "Track Every Stage Together",
                    subtitle:
                        "Share detailed updates with your partner on your baby's growth and development.",
                  ),
                  SizedBox(height: 16.h),

                  ///<-------------Timely Pregnancy Notifications card---------->
                  InvitePartnerScreenThemeCard(
                    image:
                        'assets/images/invite_partner_screen/Timely Pregnancy Notifications.png',
                    title: 'Timely Pregnancy Notifications',
                    subtitle:
                        'Keep your partner informed with alerts for every key pregnancy milestone.',
                  ),
                  SizedBox(height: 16.h),

                  /// <-------------- FAQ Card -------------->
                  FAQCard(),
                  SizedBox(height: 16.h),

                  ///<<<------- How to Invite partner(Step) card-------->
                  StepCard(),
                  SizedBox(height: 50.h),

                  ///<--------- Send Invite Primary button ------->
                  SizedBox(
                    width: double.infinity,
                    child: Utils.primaryButton(
                      title: 'Send Invite',
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.pairingScreen);
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      context: context,
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
