import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/eventCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: Text(
          
          //  "Upcoming Events",
        
                      AppLocalizations.of(context)!.upComingEvent,

        
         style: Theme.of(context).textTheme.bodyLarge)),
        SizedBox(height: 12.h),
        SizedBox(
          height: 350.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(right: 12.w, left: 15.w),
                child: EventCard(event: events[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
