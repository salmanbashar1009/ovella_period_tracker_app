import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../constant/images.dart';
import '../../view_model/splash_onboarding_view_model_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashOnBoardViewModelProvider>(context, listen: false)
          .splashController(context);
    });
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        color: colorScheme.secondary,
        child: Center(child: Image.asset(AppImages.splashLogo,fit: BoxFit.cover,)),
      ),
    );
  }
}
