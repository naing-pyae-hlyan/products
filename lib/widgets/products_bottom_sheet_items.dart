import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

class ProductsBottomSheetItems extends StatefulWidget {
  @override
  _ProductsBottomSheetItemsState createState() => _ProductsBottomSheetItemsState();
}

class _ProductsBottomSheetItemsState extends State<ProductsBottomSheetItems> {
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
          Text(
            'Add Product',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: TextUtils.headerText),
          ),
          SizedBox(height: 16.0),
          _dropDownCategory(context),
          SizedBox(height: 16.0),
          _editText(context, text: 'Product Name'),
          SizedBox(height: 16.0),
          _editText(context, text: 'Product Price'),
          SizedBox(height: 16.0),
          roundButton(context, text: 'Save Product', onPress: () {}),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _dropDownCategory(BuildContext context) {
    List<CategoryModel> categoryList = List<CategoryModel>();

    for (int i = 0; i < 4; i++) {
      CategoryModel category = CategoryModel(categoryName: 'Category ${i + 1}');
      categoryList.add(category);
    }

    return Container(
      padding:  const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CategoryModel>(
          isExpanded: true,
          value: categoryList[0],
          items: _dropDownMenuItems(context, items: categoryList),
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<CategoryModel>> _dropDownMenuItems(BuildContext context,
      {List<CategoryModel> items}) {
    List<DropdownMenuItem<CategoryModel>> widget = List();
    for (CategoryModel item in items) {
      widget.add(DropdownMenuItem(
        child: Text(item.categoryName, style: TextStyle(color: Colors.grey[700])),
        value: item,
      ));
    }
    return widget;
  }

  Widget _editText(BuildContext context, {@required String text}) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }
}
