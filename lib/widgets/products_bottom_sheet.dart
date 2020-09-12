import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

void productsBottomSheet(BuildContext context) {
  Future.delayed(
      Duration.zero,
      () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                BottomSheetItems()
              ],
            );
          }));
}