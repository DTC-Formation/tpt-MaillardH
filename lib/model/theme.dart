import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  MaterialColor color = Colors.red;
  changeColor(MaterialColor newColor) {
    color = newColor;
    notifyListeners();
  }
}
