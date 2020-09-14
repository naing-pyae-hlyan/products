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

  static Color colorConvert(String s) {
    Color c;
    s = s.replaceAll("#", "");
    if (s.length == 6) {
      c = Color(int.parse("0xFF" + s));
    } else if (s.length == 8) {
      c = Color(int.parse("0x" + s));
    }
    return c;
  }

  static Color randomColor() {
    RandomColor _randomColor = RandomColor();
    return _randomColor.randomColor(colorHue: ColorHue.blue);
  }

  static String randomColorCode(Color color) {
    MyColor _myColor = getColorNameFromColor(color);
    return _myColor.getCode;
  }
}
