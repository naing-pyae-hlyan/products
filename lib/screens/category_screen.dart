import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/category_provider.dart';
import 'package:products_app/providers/refresh_provider.dart';
import 'package:provider/provider.dart';

class BaseCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RefreshProvider(),
        )
      ],
      child: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[_sliverAppBar(context), _sliverGridWidget(context)],
      ),
      drawer: DrawerScreen(),
    );
  }

  Widget _sliverAppBar(BuildContext context) {
    return SliverAppBar(
        title: Text('Category', style: TextStyle(color: Colors.white)),
        centerTitle: false);
  }

  Widget _sliverGridWidget(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    return Consumer<RefreshProvider>(
        builder: (context, refreshProvider, child) {
      return FutureBuilder(
        future: categoryProvider.category,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Center(child: Text('${snapshot.error}')));
          }

          if (snapshot.hasData) {
            // List<CategoryModel> categoryList = List();
            if (snapshot.data is List<CategoryModel>) {
              return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    if (snapshot.data.length == index) {
                      return _addGridNewCategory(context);
                    } else {
                      return _gridCategory(context, snapshot.data, index);
                    }
                  }, childCount: snapshot.data.length + 1));
            }
          }
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }

  Widget _gridCategory(
      BuildContext context, List<CategoryModel> category, int index) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.0),
            CircleAvatar(
              backgroundColor: ThemesColor.randomColor(),
              radius: 32,
            ),
            SizedBox(height: 8.0),
            Expanded(flex: 3, child: Text('${category[index].categoryName}')),
            SizedBox(height: 8.0)
          ],
        ),
      ),
      onLongPress: () {},
    );
  }

  Widget _addGridNewCategory(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: IconButton(
          color: ThemesColor.primaryColor,
          splashColor: ThemesColor.primaryColor,
          icon: Icon(Icons.add, size: 48),
          onPressed: () {
            categoryBottomSheet(context,
                callback: () =>
                    Provider.of<RefreshProvider>(context, listen: false)
                        .refresh());
          },
        ));
  }
}
