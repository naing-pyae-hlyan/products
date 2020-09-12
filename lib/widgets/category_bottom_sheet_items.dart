import 'package:flutter/material.dart';
import 'package:products_app/data/category_table.dart';
import 'package:products_app/export.dart';

class CategoryBottomSheetItems extends StatefulWidget {
  @override
  _CategoryBottomSheetItemsState createState() =>
      _CategoryBottomSheetItemsState();
}

class _CategoryBottomSheetItemsState extends State<CategoryBottomSheetItems> {
  final _controller = TextEditingController();

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    _controller.dispose();
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
          Text('Add Category',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: TextUtils.headerText)),
          SizedBox(height: 16.0),
          _categoryInput(context, text: 'Category Name'),
          SizedBox(height: 16.0),
          roundButton(context,
              text: 'Save Category', onPress: () => _saveCategory(context)),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _categoryInput(BuildContext context, {@required String text}) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }

  Future<void> _saveCategory(BuildContext context) async {
    print('${_controller.text}');
    CategoryModel category = new CategoryModel(categoryName: _controller.text);
    await CategoryTable.insert(category);
  }
}
