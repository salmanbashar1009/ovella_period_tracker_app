import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {

  /// <------ Obscure password -------->
  bool _isObscurePassword = true;
  bool get isObscurePassword => _isObscurePassword;
  void updateObscure() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }
}
