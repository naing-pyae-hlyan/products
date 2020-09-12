import 'package:flutter/material.dart';

class DropDownCategory extends StatefulWidget {
  @override
  _DropDownCategoryState createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: 1,
      items: [
        DropdownMenuItem(
          child: Text('First Item'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Second Item'),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text('Third Item'),
          value: 3,
        ),
      ],
      onChanged: (value){
        print(value);
      },
    );
  }
}
