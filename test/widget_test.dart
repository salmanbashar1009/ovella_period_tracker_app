import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays splash image', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Find the image by asset path
    final imageFinder = find.byWidgetPredicate(
          (widget) =>
      widget is Image && widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == AppImages.splashLogo,
    );

    expect(imageFinder, findsOneWidget);
  });
}