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
      actions: [
        IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            productsBottomSheet(context);
          },
        )
      ],
    );
  }

  Widget _sliverListWidget(BuildContext context) {
    List<ProductsModel> products = new List<ProductsModel>();

    for (int i = 0; i < 12; i++) {
      ProductsModel product = ProductsModel(productName: 'A$i', productPrice: '$i.00');
      products.add(product);
    }

    return new SliverList(
      delegate:
          new SliverChildBuilderDelegate((BuildContext context, int index) {
        return _listTiles(context, products, index);
      }, childCount: products.length),
    );
  }

  Widget _listTiles(BuildContext context, List<ProductsModel> products, int index) {
    return Card(
      margin: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('${products[index].productName[0]}'.toUpperCase(),
              style: TextStyle(
                  color: Colors.white, fontSize: TextUtils.titleText)),
        ),
        title: Text(
          products[index].productName,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: TextUtils.titleText),
        ),
        trailing: Text(
          products[index].productPrice,
          style: TextStyle(color: Colors.grey, fontSize: TextUtils.contextText),
        ),
        onTap: () {
          // TODO show items details
          print('${products[index].productName}');
        },
      ),
    );
  }
}
