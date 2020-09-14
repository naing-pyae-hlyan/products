import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/category_provider.dart';
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
        slivers: <Widget>[_sliverAppBar(context), _futureSliverList(context)],
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

  Widget _futureSliverList(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    return FutureBuilder(
      future: categoryProvider.category,
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Container());
        }
        if (snapshot.hasData) {
          if (snapshot.data is List<CategoryModel>) {
            return _sliverListWidget(context, snapshot.data);
          }
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }

  Widget _sliverListWidget(
      BuildContext context, List<CategoryModel> categoryList) {
    return SliverList(
      delegate:
          new SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productsHeaderRow(context, categoryList, index),
              ProductItems(),
            ],
          ),
        );
      }, childCount: categoryList.length),
    );
  }

  Widget _productsHeaderRow(
      BuildContext context, List<CategoryModel> categoryList, int index) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor:
                ThemesColor.colorConvert(categoryList[index].categoryColor),
            radius: 8),
        SizedBox(width: 8),
        CustomText.headerText('${categoryList[index].categoryName}',
            color: Colors.grey),
      ],
    );
  }

  Widget _fabAddProduct(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () => productsBottomSheet(context),
    );
  }
}
