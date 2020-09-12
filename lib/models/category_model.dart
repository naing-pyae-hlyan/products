import 'package:products_app/data/category_table.dart';

class CategoryModel {
  String categoryName;

  CategoryModel({this.categoryName});

  set setCategory(String item) => this.categoryName = item;

  Map<String, dynamic> toMap() {
    return {
      CATEGORY_NAME : categoryName
    };
  }
}
