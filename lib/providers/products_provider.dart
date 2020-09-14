import 'package:flutter/foundation.dart';
import 'package:products_app/data/products_table.dart';
import 'package:products_app/export.dart';

class ProductsProvider with ChangeNotifier {
  Future<void> insert(ProductsModel products) {
    return ProductsTable.insert(products);
  }

  Future<List<ProductsModel>> getProductsByCategoryName(String cName) {
    return ProductsTable.getProductsByCategoryName(cName);
  }
}
