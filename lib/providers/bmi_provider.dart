import 'package:flutter/widgets.dart';

class BMIProvider extends ChangeNotifier {
  double _bmi = 0;

  double get bmi => _bmi;

  set bmi(double newValue) {
    _bmi = newValue;
    notifyListeners();
  }
}
