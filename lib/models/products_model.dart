class ProductsModel {
  String productName, productPrice;

  ProductsModel({this.productName, this.productPrice});

  set setProductName(String name) => this.productName = name;

  set setProductPrice(String price) => this.productPrice = price;
}
