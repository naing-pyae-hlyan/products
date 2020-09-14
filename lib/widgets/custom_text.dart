import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

class CustomText {
  static Text headerText(String text, {Color color}) {
    return Text(
      '$text',
      style: TextStyle(
          color: color == null ? Colors.black : color,
          fontWeight: FontWeight.bold,
          fontSize: TextUtils.headerText),
    );
  }
}
