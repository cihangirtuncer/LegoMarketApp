import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _ordersTablo = "orders";
  String _columnID = "id";
  String _columnName = "name";
  String _columnExplanation = "explanation";
  String _columnPrice = "price";

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

  Future<Database> _getDatabase() async {
    if (_database == null) {
      print("DB nulldi oluşturulacak");
      _database = await _initializeDatabase();

      return _database;
    } else {
      print("DB null değildi var olan kullanılacak");
      return _database;
    }
  }

  _initializeDatabase() async {
    Directory klasor =
        await getApplicationDocumentsDirectory(); //"c://users/emre/ogrenci.db"
    String dbPath = join(klasor.path, "ogrenci.db");
    print("DB Pathi:" + dbPath);
    var ogrenciDB = openDatabase(dbPath, version: 1, onCreate: _createDB);
    return ogrenciDB;
  }

  Future<void> _createDB(Database db, int version) async {
    print("create db metotu calıstı tablo olusturulacak");
    await db.execute(
        "CREATE TABLE $_ordersTablo ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT, $_columnExplanation TEXT, $_columnPrice INTEGER )");
  }

  Future<List<Map<String, dynamic>>> allProduct() async {
    var db = await _getDatabase();
    var sonuc = await db.query(_ordersTablo, orderBy: '$_columnID DESC');
    return sonuc;
  }
}
