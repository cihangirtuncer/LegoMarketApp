import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../features/model/products.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  // ignore: non_constant_identifier_names
  String OrdersTable = "Orders";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(
      databasesPath,
      "appLegoMarket.db",
    );

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join(
        "assets",
        "lego_market.db",
      ));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(
        bytes,
        flush: true,
      );
    } else {}
    return await openDatabase(
      path,
      readOnly: false,
    );
  }

  String categoryName;

  Future<List<Map<String, dynamic>>> productTable(String categoryName) async {
    this.categoryName = categoryName;
    var db = await getDatabase();
    var sonuc = await db.rawQuery(
      'SELECT * FROM $categoryName',
    );
    return sonuc;
  }

  Future<List<Products>> productTableList(String categoryName) async {
    categoryName = this.categoryName;
    var notlarMapListesi = await productTable(categoryName);
    // ignore: deprecated_member_use
    var productList = List<Products>();
    for (Map map in notlarMapListesi) {
      productList.add(
        Products.fromMap(map),
      );
    }
    return productList;
  }

  Future<bool> addOrders(Products products) async {
    var db = await getDatabase();
    final sonuc = await db.insert(
      OrdersTable,
      products.toMap(),
    );
    return sonuc != null;
  }

  Future<bool> delete(String table, int id) async {
    var db = await getDatabase();
    var sonuc = await db.delete(
      table,
      whereArgs: [id],
    );
    return sonuc != null;
  }
}
