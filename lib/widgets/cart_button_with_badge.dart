import 'package:flutter/material.dart';

Widget cartButtonWithBadge(BuildContext context, {int badge}) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      IconButton(
          icon: Icon(
              badge == null || badge == 0
                  ? Icons.add_shopping_cart
                  : Icons.shopping_cart,
              color: Colors.white),
          onPressed: () {}),
      Visibility(
        visible: badge == null || badge == 0 ? false : true,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.indigo,
          child: Text(badge <= 99 ? '$badge' : '99+',
              style: TextStyle(color: Colors.white, fontSize: 8)),
        ),
      )
    ],
  );
}
