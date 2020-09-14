import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

void productsBottomSheet(BuildContext context,
    {List<CategoryModel> categories, VoidCallback callback}) {
  Future.delayed(
      Duration.zero,
      () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                ProductsBottomSheetItems(
                    categories: categories, callback: callback)
              ],
            );
          }));
}
