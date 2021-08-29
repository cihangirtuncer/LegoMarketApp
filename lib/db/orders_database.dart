import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OrdersDatabase {
  static final OrdersDatabase orders = OrdersDatabase._init();
  // ignore: unused_field
  static Database? _database;
  OrdersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("orders.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) {}
  Future close() async {
    final db = await orders.database;
    db.close();
  }
}
