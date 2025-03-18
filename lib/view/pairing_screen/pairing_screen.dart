import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import '../../widgets/background_widget.dart';

class PairingScreen extends StatelessWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            Utils.backButton(context),
          ],
        ),
      ),
    );
  }
}
