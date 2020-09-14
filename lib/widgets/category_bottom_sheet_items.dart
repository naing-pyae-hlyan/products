import 'package:flutter/material.dart';
import 'package:products_app/export.dart';
import 'package:products_app/providers/category_provider.dart';
import 'package:products_app/providers/refresh_provider.dart';
import 'package:provider/provider.dart';

class CategoryBottomSheetItems extends StatefulWidget {
  final VoidCallback callback;

  CategoryBottomSheetItems({this.callback});

  @override
  _CategoryBottomSheetItemsState createState() =>
      _CategoryBottomSheetItemsState();
}

class _CategoryBottomSheetItemsState extends State<CategoryBottomSheetItems> {
  final _controller = TextEditingController();
  Color _randomColor = ThemesColor.randomColor();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RefreshProvider(),
        )
      ],
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(64.0)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            _categoryHeader(context),
            SizedBox(height: 16.0),
            _categoryInput(context, text: 'Category Name'),
            SizedBox(height: 16.0),
            roundButton(context, text: 'Save Category', onPress: () {
              _saveCategory(context, widget.callback);
              // widget.callback.call();
            }),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _categoryHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.headerText('Add Category'),
        Consumer<RefreshProvider>(builder: (context, refreshProvider, child) {
          return InkWell(
            child: CircleAvatar(
              backgroundColor: _randomColor,
            ),
            onTap: () {
              _randomColor = ThemesColor.randomColor();
              refreshProvider.refresh();
            },
          );
        })
      ],
    );
  }

  Widget _categoryInput(BuildContext context, {@required String text}) {
    return TextFormField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: text,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }

  Future<void> _saveCategory(
      BuildContext context, VoidCallback callback) async {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    if (_controller.text.isNotEmpty) {
      CategoryModel category = new CategoryModel(
          categoryName: _controller.text,
          categoryColor: '${_randomColor.value.toRadixString(16)}');
      await categoryProvider.insert(category);
      callback.call();
      Navigator.pop(context);
    }
  }
}
