import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/drawer_provider.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);

    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ThemesColor.primaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/drawer_image.jpg')
            )),
            child: Container(),
          ),
          ListTile(
            title: Text('Products'),
            leading: Icon(Icons.add_shopping_cart),
            onTap: () {
              drawerProvider.change(enumState: AppStateEnum.PRODUCT);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Category'),
            leading: Icon(Icons.category),
            onTap: () {
              drawerProvider.change(enumState: AppStateEnum.CATEGORY);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
