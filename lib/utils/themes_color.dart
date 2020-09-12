import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
class ThemesColor {
  static MaterialColor primaryColor = const MaterialColor(
    0xFF7ECDC4,
    <int, Color>{
      50: Color(0xFF7ECDC4),
      100: Color(0xFF7ECDC4),
      200: Color(0xFF7ECDC4),
      300: Color(0xFF7ECDC4),
      400: Color(0xFF7ECDC4),
      500: Color(0xFF7ECDC4),
      600: Color(0xFF7ECDC4),
      700: Color(0xFF7ECDC4),
      800: Color(0xFF7ECDC4),
      900: Color(0xFF7ECDC4),
    },
  );

  static Color generateRandomColor({ColorHue colorHue}) {
    RandomColor _randomColor = RandomColor();
    return _randomColor.randomColor(colorHue: colorHue);
  }
  static Color randomColor() {
    RandomColor _randomColor = RandomColor();
    return _randomColor.randomColor(colorHue: ColorHue.blue);
  }
}