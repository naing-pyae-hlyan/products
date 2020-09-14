import 'package:flutter/material.dart';
import 'package:products_app/export.dart';

class ProductItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 13,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _horizontalListTiles(context);
          }),
    );
  }

  Widget _horizontalListTiles(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.1,
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
            Spacer(),
            Flexible(
              child: Text(
                'Product Name',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Text(
              '75,00 MMK',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
