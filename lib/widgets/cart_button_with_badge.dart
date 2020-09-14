import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

Widget cartButtonWithBadge(BuildContext context, {int badge}) {
  return Material(
    color: Colors.transparent,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        IconButton(
            icon: Icon(
                badge == null || badge == 0
                    ? Icons.add_shopping_cart
                    : Icons.shopping_cart,
                color: Colors.white),
            onPressed: () {
              print(badge);
              if (badge > 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartItemsScreen()));
              }
            }),
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
    ),
  );
}
