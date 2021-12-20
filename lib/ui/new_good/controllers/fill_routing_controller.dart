import 'package:flutter/widgets.dart';

class FillRoutingController with ChangeNotifier {
  final _titles = [
    'Описание',
    'Оставшееся',
  ];

  int _currentIndex;

  int get currentIndex => _currentIndex;

  String get currentTitle => _titles[_currentIndex];

  FillRoutingController(this._currentIndex);

  void nextStep() {
    _currentIndex += _currentIndex == _titles.length ? 0 : 1;
    notifyListeners();
  }

  void prevStep() {
    _currentIndex -= _currentIndex == 0 ? 0 : 1;
    notifyListeners();
  }
}
