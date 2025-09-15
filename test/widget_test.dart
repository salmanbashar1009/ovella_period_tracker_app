import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/view_model/splash_onboarding_view_model_provider.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';

void main() {
  testWidgets('SplashScreen displays splash image', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SplashOnBoardViewModelProvider()),
          ],
          child: MaterialApp(home: SplashScreen()),
        ),
      ),
    );

    // Let animations, images, and providers settle
    await tester.pumpAndSettle();

    final imageFinder = find.byWidgetPredicate(
          (widget) =>
      widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == AppImages.splashLogo,
    );

    expect(imageFinder, findsOneWidget);
  });
}
