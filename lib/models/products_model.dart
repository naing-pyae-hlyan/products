import 'package:products_app/data/products_table.dart';

class ProductsModel {
  String categoryName, productName, productPrice;

  ProductsModel({this.categoryName, this.productName, this.productPrice});

  set setCategoryName(String category) => this.categoryName = category;

  set setProductName(String name) => this.productName = name;

  set setProductPrice(String price) => this.productPrice = price;

  ProductsModel.fromMap(Map<String, dynamic> map) {
    this.categoryName = map[PRODUCTS_NAME];
    this.productName = map[PRODUCTS_NAME];
    this.productPrice = map[PRODUCTS_PRICE];
  }

  Map<String, dynamic> toMap() {
    return {
      CATEGORY_NAME: this.categoryName,
      PRODUCTS_NAME: this.productName,
      PRODUCTS_PRICE: this.productPrice,
    };
  }
}
