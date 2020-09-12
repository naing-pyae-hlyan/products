import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerScreen(),
    );
  }
}
