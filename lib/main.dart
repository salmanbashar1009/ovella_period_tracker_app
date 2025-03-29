import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ovella_period_tracker_app/L10n/L10n.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/routing/routes.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme.dart';
import 'package:ovella_period_tracker_app/view_model/chat_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/community_provider.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/localization_provider.dart';
import 'package:ovella_period_tracker_app/view_model/menstrual_fertility_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/new_password_provider.dart';
import 'package:ovella_period_tracker_app/view_model/otp_provider.dart';
import 'package:ovella_period_tracker_app/view_model/pairing_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/parent_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/pregnancy_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/splash_onboarding_view_model_provider.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';
import 'view_model/settings_provider.dart';
import 'view_model/step_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set device orientation to portrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  await Hive.openBox('settings');
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double deviceWidth = 402.0;
  static const double deviceHeight = 874.0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ParentScreenProvider>(
          create: (_) => ParentScreenProvider(),
        ),
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(),
        ),
        ChangeNotifierProxyProvider<HomeScreenProvider,TrackingScreenProvider>(
          create: (_) => TrackingScreenProvider(HomeScreenProvider()),
          update: (_,homeScreenProvider,_) => TrackingScreenProvider(homeScreenProvider),
        ),
        ChangeNotifierProvider<CommunityProvider>(
          create: (_) => CommunityProvider(),
        ),
        ChangeNotifierProvider<SplashOnBoardViewModelProvider>(
          create: (_) => SplashOnBoardViewModelProvider(),
        ),
        ChangeNotifierProvider<StepScreenProvider>(
          create: (_) => StepScreenProvider(),
        ),
        ChangeNotifierProvider<CreateAccountProvider>(
          create: (_) => CreateAccountProvider(),
        ),
        ChangeNotifierProvider<OtpProvider>(create: (_) => OtpProvider()),
        ChangeNotifierProvider<NewPasswordProvider>(
          create: (_) => NewPasswordProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
        ChangeNotifierProvider<PregnancyScreenProvider>(
          create: (_) => PregnancyScreenProvider(),
        ),
        ChangeNotifierProvider<PairingScreenProvider>(
          create: (_) => PairingScreenProvider(),
        ),

        ChangeNotifierProvider<ChatScreenProvider>(
          create: (_) => ChatScreenProvider(),
        ),
        ChangeNotifierProvider<LocalizationProvider>(create: (_) => LocalizationProvider()),
        ChangeNotifierProxyProvider<TrackingScreenProvider,MenstrualFertilityScreenProvider>(
            create: (context) => MenstrualFertilityScreenProvider(trackingScreenProvider: Provider.of<TrackingScreenProvider>(context,listen: false)),
            update: (context,trackingScreenProvider,previous) => MenstrualFertilityScreenProvider(trackingScreenProvider: trackingScreenProvider)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(deviceWidth, deviceHeight),
        minTextAdapt: true,
        ensureScreenSize: true,
        builder: (context, child) {

          final localProvider = Provider.of<LocalizationProvider>(context);
       //   debugPrint("\nlocalization : ${localProvider.locale!.languageCode}\n");
          return MaterialApp(
            
            supportedLocales: L10n.all,
          locale: localProvider.locale ,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Ovella',
            theme: AppTheme.lightTheme,

            initialRoute: RouteName.splashScreen,

            routes: AppRoutes.getRoutes(),
          );
        },
      ),
    );
  }
}
