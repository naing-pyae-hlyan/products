import 'package:path/path.dart';
import 'package:products_app/data/category_table.dart';
import 'package:products_app/data/products_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String _databaseName = 'products.db';
  final int _databaseVersion = 1;

  static Database _db;

  Future<Database> get db async {
    // Get a singleton database
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    // Get a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    // This will delete old/previous database when app is opened
    // Delete the database
    // await deleteDatabase(path)

    // Open the database
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    await CategoryTable.onCreate(db);
    await ProductsTable.onCreate(db);

    // Create other tables ...
  }

  static Future clearTables() async {
    await CategoryTable.deleteAll();
    await ProductsTable.deleteAll();

    // Clear other tables ...
  }
}
