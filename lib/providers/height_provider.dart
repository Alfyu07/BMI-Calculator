import 'package:flutter/widgets.dart';

class HeightProvider with ChangeNotifier {
  double _value = 100;

  double get value => _value;
  set value(double newValue) {
    _value = newValue.roundToDouble();
    notifyListeners();
  }
}
