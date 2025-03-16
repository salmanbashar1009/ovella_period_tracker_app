import 'package:flutter/cupertino.dart';

class NewPasswordProvider extends ChangeNotifier {
  bool _isObscurePassword = true;
  bool get isObscurePassword => _isObscurePassword;

  bool _isObscureRePassword = true;
  bool get isObscureRePassword => _isObscureRePassword;

  void updateObscure() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  void updateObscureRePassword() {
    _isObscureRePassword = !_isObscureRePassword;
    notifyListeners();
  }
}
