import 'package:sqflite/sqflite.dart';

class Orders {
  // ignore: unused_field
  late int _id;
  // ignore: unused_field
  late String _name;
  // ignore: unused_field
  late int _price;
  // ignore: unused_field
  late String _explanation;

  // ignore: unnecessary_getters_setters
  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get name => _name;
  // ignore: unnecessary_getters_setters
  int get price => _price;
  // ignore: unnecessary_getters_setters
  String get explanation => _explanation;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }

  // ignore: unnecessary_getters_setters
  set price(int value) {
    _price = value;
  }

  // ignore: unnecessary_getters_setters
  set name(String value) {
    _name = value;
  }

// ignore: unnecessary_getters_setters
  set explanation(String value) {
    _explanation = value;
  }

  Orders(this._name, this._explanation, this._price);
  Orders.withID(this._id, this._name, this._explanation, this._price);

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String, dynamic>();
    // ignore: unnecessary_statements
    map["id"] = _id;
    // ignore: unnecessary_statements
    map["name"] = _name;
    // ignore: unnecessary_statements
    map["price"] = _price;
    // ignore: unnecessary_statements
    map["explanation"] = _explanation;
    return map;
  }
}
