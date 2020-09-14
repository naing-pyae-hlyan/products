import 'package:products_app/data/category_table.dart';

class CategoryModel {
  String categoryName;
  String categoryColor;

  CategoryModel({this.categoryName, this.categoryColor});

  set setCategoryName(String item) => this.categoryName = item;

  set setCategoryColor(String color) => this.categoryColor = color;

  Map<String, dynamic> toMap() {
    return {
      CATEGORY_NAME: this.categoryName,
      CATEGORY_COLOR: this.categoryColor
    };
  }
}
