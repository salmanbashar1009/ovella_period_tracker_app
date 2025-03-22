import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/joinButton.dart';
import 'package:ovella_period_tracker_app/model/groupModel.dart'; // Import your model

class GroupCard extends StatelessWidget {
  final GroupModel group;

  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            "People(25+)",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              ...group.memberImages.map(
                (image) => Image.asset(image, height: 35.h, width: 35.w),
              ),
              Spacer(),
              Joinbutton(name: "Join group"),
            ],
          ),
        ],
      ),
    );
  }
}
