import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(child: Padding(
        padding: AppPadding.screenHorizontalPadding,
        child: Column(
          children: [
            HeaderWidget(title: 'Notifications'),
            ListView.builder(itemBuilder: (context,index){
              return ListTile();
            })
          ],
        ),
      )),
    );
  }
}
