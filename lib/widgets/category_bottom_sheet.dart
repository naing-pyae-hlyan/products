import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

void categoryBottomSheet(BuildContext context) {
  Future.delayed(
      Duration.zero,
      () => showDialog(context: context,
  builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(128.0)
            ),
            child: Wrap(
              children: [
                CategoryBottomSheetItems()
              ],
            ));
  }));
}
