import 'package:products_app/export.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';

const TABLE_NAME = 'category_table';
const CATEGORY_ID = 'category_id';
const CATEGORY_NAME = 'category_name';
const CATEGORY_COLOR = 'category_color';

class CategoryTable {
  static Future<void> onCreate(Database db) async {
    await db.execute(
      'CREATE TABLE $TABLE_NAME('
      '$CATEGORY_ID INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$CATEGORY_NAME TEXT,'
      '$CATEGORY_COLOR TEXT'
      ')',
    );
  }

  static Future<void> insert(CategoryModel category) async {
    final Database db = await DatabaseHelper().db;

    // Insert category into the table.
    // also specify the 'conflictAlgorithm'.
    // In this case, if the same category is inserted multiple times,
    // it replace the previous data.
    return await db.insert(TABLE_NAME, category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<CategoryModel>> get getAll async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper().db;

    // Query the table for all category
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    // Convert the list<Map<String, dynamic>> into List<Category>.
    return List.generate(maps.length, (i) {
      return CategoryModel(
          categoryName: maps[i][CATEGORY_NAME],
          categoryColor: maps[i][CATEGORY_COLOR]);
    });
  }

  static Future<int> deleteAll() async {
    // Get a reference to the database
    final Database db = await DatabaseHelper().db;
    return db.delete(TABLE_NAME);
  }
}
