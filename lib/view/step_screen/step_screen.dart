import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

class StepScreen extends StatelessWidget {
  const StepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Utils.backButton(context),
            ],
          )
        ],
      ),
    );
  }
}
