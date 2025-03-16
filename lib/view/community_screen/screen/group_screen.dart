import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/joingroupTile.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular Groups", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: group1.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GroupCard(group: group1[index]);
            },
          ),
        ),
      ],
    );
  }
}
