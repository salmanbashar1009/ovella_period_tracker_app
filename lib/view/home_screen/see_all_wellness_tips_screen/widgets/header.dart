import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

class WellnessTipsAppBar extends StatelessWidget{
  const WellnessTipsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: Utils.backButton(context),
        title: Text("Tailored Wellness Journey"),
      ),
    );
  }
}