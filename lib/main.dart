import 'package:flutter/material.dart';
import 'package:products_app/providers/drawer_provider.dart';
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
