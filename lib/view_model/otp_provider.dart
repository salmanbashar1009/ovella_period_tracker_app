import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:provider/provider.dart';

import 'create_account_provider.dart';

class OtpProvider extends ChangeNotifier {
  final int otpLength = 5;
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  String previousRoute = 'Login';

  void updatePreviousRoute(String routeName) {
    previousRoute = routeName;
    notifyListeners();
  }

  OtpProvider() {
    controllers = List.generate(otpLength, (index) => TextEditingController());
    focusNodes = List.generate(otpLength, (index) => FocusNode());
  }

  String get otpCode => controllers.map((controller) => controller.text).join();

  void verifyOtp(BuildContext context) {
    if (otpCode.length == otpLength) {
      if (otpCode == "12345") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("OTP Verified Successfully!")));
        if (previousRoute == 'Login') {
          Navigator.pushNamed(context, RouteName.createNewPassword);
        } else {
          final createAccountProvider = Provider.of<CreateAccountProvider>(
            context,
            listen: false,
          );
          createAccountProvider.changeIsExpand(false);
          Navigator.pop(context);
          createAccountProvider.changeIsExpand(false);
          createAccountProvider.updatePage(1);
          previousRoute == 'Login';
        }
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Incorrect OTP! Try Again.")));
      }
    }
  }

  void resendOtp(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("OTP Resent Successfully!")));
  }

  void handleInputChange(BuildContext context, String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
