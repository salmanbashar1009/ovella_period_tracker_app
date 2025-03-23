import 'dart:math';
import 'package:flutter/cupertino.dart';

class PairingScreenProvider extends ChangeNotifier{

  /// <----------- Random Code Generate ---------->
  late String code;

  PairingScreenProvider() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    String generateSegment(int length) {
      return List.generate(
        length,
            (index) => chars[random.nextInt(chars.length)],
      ).join();
    }

    code = '${generateSegment(4)}-${generateSegment(4)}';
    notifyListeners();
  }
  void generateCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    String generateSegment(int length) {
      return List.generate(
        length,
            (index) => chars[random.nextInt(chars.length)],
      ).join();
    }

    code = '${generateSegment(4)}-${generateSegment(4)}';
    notifyListeners();
  }
}