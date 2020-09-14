import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

class ProductItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 13,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                color: ThemesColor.randomColor(), height: 120, width: 120);
          }),
    );
  }
}
