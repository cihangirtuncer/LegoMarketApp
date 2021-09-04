import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:lego_market_app/models/foods.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      print("DBHelper nulldi oluşturuldu");
      return _databaseHelper;
    } else {
      print("DBHelper null değildi var olan kullanılacak");
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> getDatabase() async {
    if (_database == null) {
      print("DB nulldi oluşturulacak");
      _database = await _initializeDatabase();
      return _database;
    } else {
      print("DB null değildi var olan kullanılacak");
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "appLegoMarket2.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "lego_market.db"));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      // Write and flush the bytes written
      await File(path).writeAsBytes(
        bytes,
        flush: true,
      );
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(
      path,
      readOnly: false,
    );
  }

  String categoryName;

  Future<List<Map<String, dynamic>>> foodsFetch(String categoryName) async {
    this.categoryName = categoryName;
    var db = await getDatabase();
    var sonuc = await db.rawQuery('select * from $categoryName order by name;');
    return sonuc;
  }

  Future<List<Products>> fetchFoodsList(String categoryName) async {
    categoryName = this.categoryName;
    var notlarMapListesi = await foodsFetch(categoryName);
    // ignore: deprecated_member_use
    var foodsList = List<Products>();
    for (Map map in notlarMapListesi) {
      foodsList.add(Products.fromMap(map));
    }
    return foodsList;
  }
}
