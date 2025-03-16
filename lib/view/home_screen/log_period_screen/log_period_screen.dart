import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class LogPeriodScreen extends StatelessWidget{
  const LogPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: SafeArea(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Utils.backButton(context),

                      Text("Log Period",
                      style: Theme.of(context).textTheme.headlineMedium,)
                    ],
                  )
                ],
              ),
            ),
        )
    );
  }
}