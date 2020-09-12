import 'package:flutter/material.dart';
import 'package:products_app/enum/app_enum.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/drawer_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      body: Consumer<DrawerProvider>(
        builder: (context, drawerProvider, child) {
          Widget body;
          switch (drawerProvider.getState) {
            case AppStateEnum.PRODUCT:
              body = BaseProductScreen();
              break;

            case AppStateEnum.CATEGORY:
              body = BaseCategoryScreen();
              break;
          }
          return body;
        },
      ),
    );
  }
}
