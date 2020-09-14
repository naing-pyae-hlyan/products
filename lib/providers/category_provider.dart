import 'package:flutter/foundation.dart';
import 'package:products_app/data/category_table.dart';
import 'package:products_app/export.dart';

class CategoryProvider with ChangeNotifier {

  Future<List<CategoryModel>> get category {
    return CategoryTable.getAll;
  }
}

