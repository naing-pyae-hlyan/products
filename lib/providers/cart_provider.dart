import 'package:flutter/foundation.dart';
import 'package:products_app/export.dart';

class CartProvider with ChangeNotifier {
  List<ProductsModel> products;

  CartProvider({this.products});

  get length => this.products == null ? 0 : this.products.length;


  void setProducts(ProductsModel model) {
    this.products.add(model);
    notifyListeners();
  }

  void clear() {
    this.products.clear();
    notifyListeners();
  }
}