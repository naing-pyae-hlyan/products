import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsBottomSheetItems extends StatefulWidget {
  final List<CategoryModel> categories;
  final VoidCallback callback;

  ProductsBottomSheetItems({this.categories, this.callback});

  @override
  _ProductsBottomSheetItemsState createState() =>
      _ProductsBottomSheetItemsState();
}

class _ProductsBottomSheetItemsState extends State<ProductsBottomSheetItems> {
  final _pNameController = TextEditingController();
  final _pPriceController = TextEditingController();
  String _dropDownValue;
  CategoryModel _selectedCategory;

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    _pNameController.dispose();
    _pPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(64.0)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          CustomText.headerText('Add Product'),
          SizedBox(height: 16.0),
          _dropDownCategory(context, widget.categories),
          SizedBox(height: 16.0),
          _productNameInputForm(context, text: 'Product Name'),
          SizedBox(height: 16.0),
          _productPriceInputForm(context, text: 'Product Price'),
          SizedBox(height: 16.0),
          roundButton(context, text: 'Save Product', onPress: () {
            _saveProducts(context, widget.callback);
          }),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _dropDownCategory(
      BuildContext context, List<CategoryModel> categoryList) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CategoryModel>(
          isExpanded: true,
          value: _selectedCategory,
          onChanged: (CategoryModel value) {
            setState(() {
              _dropDownValue = value.categoryName;
              _selectedCategory = value;
            });
          },
          items: categoryList.map((CategoryModel category) {
            return _dropdownMenuItem(context, category);
          }).toList(),
        ),
      ),
    );
  }

  DropdownMenuItem<CategoryModel> _dropdownMenuItem(
      BuildContext context, CategoryModel item) {
    return DropdownMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.categoryName, style: TextStyle(color: Colors.grey[700])),
          CircleAvatar(
            radius: 12,
            backgroundColor: ThemesColor.colorConvert(item.categoryColor),
          ),
        ],
      ),
      value: item,
    );
  }

  Widget _productNameInputForm(BuildContext context, {@required String text}) {
    return TextFormField(
      controller: _pNameController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }

  Widget _productPriceInputForm(BuildContext context, {@required String text}) {
    return TextFormField(
      controller: _pPriceController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }

  Future<void> _saveProducts(
      BuildContext context, VoidCallback callback) async {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    if (_pNameController.text.isNotEmpty &&
        _pPriceController.text.isNotEmpty &&
        _dropDownValue != null) {
      ProductsModel products = new ProductsModel(
          categoryName: _dropDownValue,
          productName: _pNameController.text,
          productPrice: _pPriceController.text);
      await productsProvider.insert(products);
      callback.call();
      Navigator.pop(context);
    }
  }
}
