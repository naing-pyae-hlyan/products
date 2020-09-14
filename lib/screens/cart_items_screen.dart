import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/cart_provider.dart';
import 'package:products_app/providers/refresh_provider.dart';
import 'package:provider/provider.dart';

class CartItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RefreshProvider(),
        )
      ],
      child: Consumer<RefreshProvider>(
        builder: (context, refreshProvider, child) {
          return Scaffold(
            body: Hero(
              tag: CART_HERO,
              child: CustomScrollView(
                slivers: <Widget>[
                  _sliverAppBar(context),
                  _futureSliverList(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sliverAppBar(BuildContext context) {

    return SliverAppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text('Cart', style: TextStyle(color: Colors.white)),
      centerTitle: false,
      actions: [
        FlatButton.icon(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).clear();
              Provider.of<RefreshProvider>(context, listen: false).refresh();
            },
            icon: Icon(Icons.delete, color: Colors.white),
            label: Text(
              'Remove All',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  Widget _futureSliverList(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final List<ProductsModel> mList = cartProvider.products;

    if (mList.isNotEmpty && mList != null) {
      return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index >= mList.length) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomText.headerText('Total: ')),
                  SizedBox(height: 8),
                  roundButton(context, text: 'Check Out', onPress: () {}),
                  SizedBox(
                    height: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 4,
                  )
                ],
              ),
            );
          }

          return _itemsList(context, mList, index);
        }, childCount: mList.length + 1),
      );
    }
    return SliverToBoxAdapter(child: Container());
  }

  Widget _itemsList(
      BuildContext context, List<ProductsModel> products, int index) {
    return Card(
      margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: ThemesColor.randomColor(),
              child: Text('${products[index].productName[0].toUpperCase()}',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16),
            _itemsBottomRow(context, products, index)
          ],
        ),
      ),
    );
  }

  Widget _itemsBottomRow(
      BuildContext context, List<ProductsModel> products, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${products[index].productName}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '${products[index].productPrice}',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        plusMinusButton(context)
      ],
    );
  }
}
