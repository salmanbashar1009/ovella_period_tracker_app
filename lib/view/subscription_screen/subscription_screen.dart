import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Column(
            children: [
              AppBar(leading: Utils.backButton(context)),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16.h,),
                    Container(
                      padding: AppPadding.screenPadding,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xffFF4A7A), Color(0xff7F30F4)],
                        ),
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Unlock Full Access to Ovella',
                            style: textTheme.headlineMedium!.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Text(
                            'Your ultimate period and pregnancy tracking companion.',
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: AppPadding.screenPadding,
                      decoration: BoxDecoration(
                        color: colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(20.r)
                      ),

                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
