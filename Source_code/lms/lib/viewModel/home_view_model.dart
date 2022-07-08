import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;
  void changeIndex(int i) {
    _index = i;
    notifyListeners();
  }
}
