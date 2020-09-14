import 'package:flutter/material.dart';

Widget plusMinusButton(BuildContext context,
    {VoidCallback plusPress, VoidCallback minusPress}) {
  return Container(
    child: Row(
      children: [
        IconButton(
            icon: Icon(Icons.remove, color: Colors.red),
            onPressed: minusPress),
        IconButton(
            icon: Icon(Icons.add, color: Colors.green),
            onPressed: minusPress),
      ],
    ),
  );
}
