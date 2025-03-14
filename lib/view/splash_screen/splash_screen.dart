import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/splash_onboarding_view_model_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashOnBoardViewModelProvider>(context, listen: false)
          .splashController(context);
    });
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
