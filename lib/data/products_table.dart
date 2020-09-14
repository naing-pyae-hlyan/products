import 'package:products_app/export.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';

const TABLE_NAME = 'products_table';
const PRODUCTS_ID = 'products_id';
const CATEGORY_NAME = 'category_name';
const PRODUCTS_NAME = 'products_name';
const PRODUCTS_PRICE = 'products_price';

class ProductsTable {
  static Future<void> onCreate(Database db) async {
    await db.execute(
      'CREATE TABLE $TABLE_NAME('
      '$PRODUCTS_ID INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$CATEGORY_NAME TEXT,'
      '$PRODUCTS_NAME TEXT,'
      '$PRODUCTS_PRICE TEXT'
      ')',
    );
  }

  static Future<void> insert(ProductsModel products) async {
    final Database db = await DatabaseHelper().db;

    return await db.insert(TABLE_NAME, products.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<ProductsModel>> getProductsByCategoryName(
      String categoryName) async {
    final Database db = await DatabaseHelper().db;

    // Query the table for all products
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
        where: '$CATEGORY_NAME=?', whereArgs: [categoryName]);

    return List.generate(maps.length, (index) {
      return ProductsModel.fromMap(maps[index]);
    });
  }

  static Future<int> deleteAll() async {
    final Database db = await DatabaseHelper().db;
    return db.delete(TABLE_NAME);
  }
}
