import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier{
  bool _periodAlerts = false;
  bool _pregnancyTips = false;
  bool _mentalHealth = false;
  bool get periodAlerts => _periodAlerts;
  bool get pregnancyTips => _pregnancyTips;
  bool get mentalHealth => _mentalHealth;
  void updatePeriodAlerts(bool value){
    _periodAlerts = value;
    notifyListeners();
  }void updatePregnancyTips(bool value){
    _pregnancyTips = value;
    notifyListeners();
  }void updateMentalHealth(bool value){
    _mentalHealth = value;
    notifyListeners();
  }


  ///<<<-------------- Term & condition --------->>
  bool _acceptTermsConditions = false;
  bool get acceptTermsConditions => _acceptTermsConditions;
  void updateAcceptTeamCondition(value){
    _acceptTermsConditions = value;
    notifyListeners();
  }
}