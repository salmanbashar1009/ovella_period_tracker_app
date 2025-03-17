import 'package:flutter/cupertino.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_account_screen/widgets/create_account_email_form.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_account_screen/widgets/create_account_password_form.dart';

class CreateAccountProvider extends ChangeNotifier {
  ///<<<------------ Page View Part--------------->>
  int _currentIndex = 0;
  bool _isExpand=false;
  bool get isExpand => _isExpand;
  void changeIsExpand(bool value){
    _isExpand = value;
    notifyListeners();
  }
  final PageController _pageController = PageController();
  final List<Widget> _carouselItems = [
    CreateAccountEmailForm(),
    CreateAccountPasswordForm(),
  ];

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  List<Widget> get carouselItems => _carouselItems;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updatePage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    updateIndex(pageIndex);
  }

  ///<<<---------------Password obscure par ----------->
  bool _isObscurePassword = true;
  bool get isObscurePassword => _isObscurePassword;
  void updateObscure() {
    _isObscurePassword = !_isObscurePassword;
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
