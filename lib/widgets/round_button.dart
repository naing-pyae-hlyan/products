import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

Widget roundButton(BuildContext context,
    {@required String text, @required VoidCallback onPress}) {
  return SizedBox(
    width: double.infinity,
    child: FlatButton(
      padding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: ThemesColor.primaryColor,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
      onPressed: onPress,
    ),
  );
}
