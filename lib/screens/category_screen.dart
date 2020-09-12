import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

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
    List<Category> categoryList = new List();

    for (int i = 1; i < 13; i++) {
      Category c = Category(category: 'Category $i');
      categoryList.add(c);
    }

    return new SliverGrid(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate:
          new SliverChildBuilderDelegate((BuildContext context, int index) {

            print(index);
            if(categoryList.length == index){
              return _addGridNewCategory(context);
            } else {
              return _gridCategory(context, categoryList, index);
            }
      }, childCount: categoryList.length + 1),
    );
  }

  Widget _gridCategory(
      BuildContext context, List<Category> category, int index) {
    return Card(
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
          Expanded(flex: 3, child: Text('${category[index].category}')),
          SizedBox(height: 8.0)
        ],
      ),
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
          onPressed: () {},
        ));
  }
}
