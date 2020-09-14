import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/refresh_provider.dart';
import 'package:provider/provider.dart';

class BaseProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RefreshProvider(),
        )
      ],
      child: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[_sliverAppBar(context), _sliverListWidget(context)],
      ),
      drawer: DrawerScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _fabAddProduct(context),
    );
  }

  Widget _sliverAppBar(BuildContext context) {
    return SliverAppBar(
      title: Text('Products', style: TextStyle(color: Colors.white)),
      centerTitle: false,
      expandedHeight: MediaQuery.of(context).size.height / 4,
      flexibleSpace: FlexibleSpaceBar(
        background:
            Image.asset('assets/images/products_image.jpg', fit: BoxFit.cover),
      ),
    );
  }

  Widget _sliverListWidget(BuildContext context) {
    List<ProductsModel> products = new List<ProductsModel>();
    for (int i = 0; i < 12; i++) {
      ProductsModel product =
          ProductsModel(productName: 'A$i', productPrice: '$i.00');
      products.add(product);
    }
    return SliverList(
      delegate:
          new SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.headerText('Product 1', color: Colors.grey),
                  ProductItems(),
                ],
              ),
            );
      }, childCount: 5),
    );
  }

  Widget _fabAddProduct(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () => productsBottomSheet(context),
    );
  }
}
