import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  final String categoryName;

  ProductItems({this.categoryName});

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return FutureBuilder(
      future: productsProvider.getProductsByCategoryName(categoryName),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductsModel>> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.hasData) {
          if (snapshot.data is List<ProductsModel>) {
            return _horizontalListBuilder(context, snapshot.data);
          }
        }
        return Container();
      },
    );
  }

  Widget _horizontalListBuilder(
      BuildContext context, List<ProductsModel> productList) {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _horizontalListTiles(context, productList, index);
          }),
    );
  }

  Widget _horizontalListTiles(
      BuildContext context, List<ProductsModel> productList, int index) {
    return Card(
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.1,
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: ThemesColor.randomColor(),
              child: Text('${productList[index].productName[0].toUpperCase()}'),
            ),
            Spacer(),
            Flexible(
              child: Text(
                '${productList[index].productName}',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Text(
              '${productList[index].productPrice}',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
