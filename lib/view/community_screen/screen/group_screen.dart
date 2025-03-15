import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/joingroupTile.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return   ListView.builder(
      itemCount: group1.length,
      itemBuilder: (BuildContext context, int index) {
        return GroupCard(group: group1[index]);
      },
    );}}

