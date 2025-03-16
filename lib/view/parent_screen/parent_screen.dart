import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/parent_screen/widgets/app_bottom_nav_bar.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            Expanded(child: AppBottomNavBar()),
          ],
        ),
      ),

    );
  }
}
