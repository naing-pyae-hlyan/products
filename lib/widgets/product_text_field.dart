import 'package:flutter/material.dart';

class ProductTextField extends StatefulWidget {
  final text;
  final ValueChanged<String> valueChanged;
  ProductTextField({this.text, this.valueChanged});

  @override
  _ProductTextFieldState createState() => _ProductTextFieldState();
}

class _ProductTextFieldState extends State<ProductTextField> {
  TextEditingController _controller;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          labelText: widget.text,
          hintText: widget.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }
}
