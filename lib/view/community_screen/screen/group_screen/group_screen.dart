import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/groupCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                                            padding: AppPadding.screenHorizontalPadding,

            child: Text(
              AppLocalizations.of(context)!.populargroups, 
              
              style: Theme.of(context).textTheme.bodyLarge)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: group1.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                padding: AppPadding.screenHorizontalPadding,

                child: GroupCard(group: group1[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
