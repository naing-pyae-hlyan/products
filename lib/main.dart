import 'package:flutter/material.dart';
import 'package:products_app/providers/cart_badge_provider.dart';
import 'package:products_app/providers/category_provider.dart';
import 'package:products_app/providers/drawer_provider.dart';
import 'package:products_app/providers/products_provider.dart';
import 'package:products_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DrawerProvider(AppStateEnum.PRODUCT),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartBadgeProvider(badge: 0),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        theme: ThemeData(
          primarySwatch: ThemesColor.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
