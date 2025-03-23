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
        orElse: () => Locale('ar'),
      );
    }
  }
}