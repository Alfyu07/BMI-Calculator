import 'package:flutter/widgets.dart';

class GenderProvider with ChangeNotifier {
  bool _isMale = true;

  bool get isMale => _isMale;

  set isMale(bool newValue) {
    _isMale = newValue;
    notifyListeners();
  }

  double get idealFactor => _isMale ? 0.1 : 0.15;
}
