import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:ui' show Locale;

import 'package:ovella_period_tracker_app/l10n/l10n.dart';

class LocalizationProvider with ChangeNotifier {
  Locale? _locale;
  final Box settingsBox = Hive.box('settings');
  LocalizationProvider() {
    _loadLocale();
  }

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!L10n.all.contains(locale) && locale != null) {
      return;
    }else{
      _locale = locale;
      notifyListeners();
    }
    await settingsBox.put('locale', locale.languageCode);
    // notifyListeners();
  }

  void clearLocale() async {
    _locale = null;
    await settingsBox.delete('locale');
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

  Future<void> onTapChangeLanguage(String languageCode) async {
    try {

      if (_locale?.languageCode != languageCode) {
       await setLocale(Locale(languageCode));

        debugPrint(
          "\nLanguage changed to: $languageCode\n",
        );

      } else {
        debugPrint(
          "\nSelected language is already active.\n",
        );
      }
      notifyListeners();
    } catch (e) {
      debugPrint(
        "\nError changing language: $e\n",
      );
    }
  }

}