import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/home_screen/see_all_wellness_tips_screen/widgets/header.dart';

import '../../../widgets/background_widget.dart';

class WellnessTipsScreen extends StatelessWidget{
  const WellnessTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WellnessTipsAppBar(),
          Padding(
              padding: AppPadding.screenPadding,
            child: SizedBox(),
          )

        ],
      ),
    );
  }
}