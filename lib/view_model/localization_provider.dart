import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/hive_box_name.dart';
import 'package:ovella_period_tracker_app/l10n/l10n.dart'; // Your L10n class
import 'package:ovella_period_tracker_app/services/local_storage_services/hive_services.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';
class LocalizationProvider with ChangeNotifier {
  Locale? _locale;

  LocalizationProvider() {
    _loadLocale();
  }

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return; 
    _locale = locale;
    await HiveServices.saveToHive(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.localeModelName, 
      jsonData: locale.languageCode
    );
    notifyListeners();
  }

  Future<void> _loadLocale() async {
    var langCode = await HiveServices.fetchHiveData(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.localeModelName, 
    );

    if (langCode != null && langCode is String) {
      _locale = L10n.all.firstWhere(
        (loc) => loc.languageCode == langCode,
        orElse: () => const Locale('en'),
      );
    } else {
      _locale = const Locale('en');
      await HiveServices.saveToHive(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.localeModelName, 
        jsonData: 'en'
      );
    }
    notifyListeners();
  }

  Future<void> onTapChangeLanguage(BuildContext context, String languageCode) async {
    if (_locale?.languageCode != languageCode) {
      await setLocale(Locale(languageCode)); 
      // ignore: use_build_context_synchronously
      context.read<StepScreenProvider>().loadSelectedLanguage();
    }
  }
}

// class LocalizationProvider with ChangeNotifier {
//   Locale? _locale;
//   final Box settingsBox = Hive.box('settings');
  
//   LocalizationProvider() {
//     _loadLocale();
//   }

//   Locale? get locale => _locale;

//   Future<void> setLocale(Locale locale) async {
//     if (!L10n.all.contains(locale)) return; 

//     _locale = locale;
//     await settingsBox.put('locale', locale.languageCode); 
//     notifyListeners(); 
//   }

//   void _loadLocale() {
//     String? langCode = settingsBox.get('locale');
//     if (langCode != null) {
//       _locale = L10n.all.firstWhere(
//         (loc) => loc.languageCode == langCode,
//         orElse: () => Locale('en'), 
//       );}else {
//     _locale = const Locale('en');
//     settingsBox.put('locale', 'en'); // Save default language
//   }
    
//   }

//   Future<void> onTapChangeLanguage(BuildContext context, String languageCode) async {
//     if (_locale?.languageCode != languageCode) {
//       await setLocale(Locale(languageCode)); 
//       context.read<StepScreenProvider>().loadSelectedLanguage();
//     }
//   }
// }
