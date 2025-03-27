import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:ui' show Locale;
import 'package:ovella_period_tracker_app/l10n/l10n.dart'; // Your L10n class
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';

class LocalizationProvider with ChangeNotifier {
  Locale? _locale;
  final Box settingsBox = Hive.box('settings');
  
  LocalizationProvider() {
    _loadLocale();
  }

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return; 

    _locale = locale;
    await settingsBox.put('locale', locale.languageCode); 
    notifyListeners(); 
  }

  void _loadLocale() {
    String? langCode = settingsBox.get('locale');
    if (langCode != null) {
      _locale = L10n.all.firstWhere(
        (loc) => loc.languageCode == langCode,
        orElse: () => Locale('en'), 
      );
    }
  }

  Future<void> onTapChangeLanguage(BuildContext context, String languageCode) async {
    if (_locale?.languageCode != languageCode) {
      await setLocale(Locale(languageCode)); 
      context.read<StepScreenProvider>().loadSelectedLanguage();
    }
  }
}
