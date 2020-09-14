import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class ProductsBottomSheetItems extends StatefulWidget {
  @override
  _ProductsBottomSheetItemsState createState() =>
      _ProductsBottomSheetItemsState();
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
          _futureDropDown(context),
          SizedBox(height: 16.0),
          _editText(context, text: 'Product Name'),
          SizedBox(height: 16.0),
          _editText(context, text: 'Product Price'),
          SizedBox(height: 16.0),
          roundButton(context, text: 'Save Product', onPress: () {
            Navigator.pop(context);
          }),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _futureDropDown(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    return FutureBuilder(
      future: categoryProvider.category,
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }
        if (snapshot.hasData) {
          if (snapshot.data is List<CategoryModel>) {
            return _dropDownCategory(context, snapshot.data);
          }
        }
        return Container();
      },
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
