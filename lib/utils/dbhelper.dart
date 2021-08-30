import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lego_market_app/models/orders.dart';

class DatabaseHelper {
  // ignore: unused_field
  static final _databasename = "ordersdb.db";
  // ignore: unused_field
  static final _databaseversion = 1;
  static final table = 'orders_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnExplanation = 'explanaton';
  static final columnPrice = 'price';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper order = DatabaseHelper._privateConstructor();
  // ignore: unused_field
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _databasename);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnExplanation TEXT NOT NULL,
      $columnPrice INTEGER NOT NULL, 
    )
   ''');
  }

  Future<int> insert(Orders orders) async {
    Database db = await order.database;
    return await db.insert(table, {
      'name': orders.name,
      'explanation': orders.explanation,
      'price': orders.price,
    });
  }

  Future<int> update(Orders orders) async {
    Database db = await order.database;
    int id = orders.toMap()['id'];
    return await db.update(
      table,
      orders.toMap(),
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await order.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await order.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> querRows(name) async {
    Database db = await order.database;
    return await db.query(table, where: "$columnName LIKE '%$name%'");
  }
}
