class Products {
  String productName, productPrice;

  Products({this.productName, this.productPrice});

  set setProductName(String name) => this.productName = name;

  set setProductPrice(String price) => this.productPrice = price;
}
