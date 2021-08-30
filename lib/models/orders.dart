class Orders {
  int _id;
  String _name;
  int _price;
  String _explanation;

  // ignore: unnecessary_getters_setters
  int get id => _id;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }

  // ignore: unnecessary_getters_setters
  String get name => _name;

  // ignore: unnecessary_getters_setters
  set name(String value) {
    _name = value;
  }

  // ignore: unnecessary_getters_setters
  int get price => _price;

  // ignore: unnecessary_getters_setters
  set price(int value) {
    _price = value;
  }

  // ignore: unnecessary_getters_setters
  String get explanation => _explanation;

  // ignore: unnecessary_getters_setters
  set explanation(String value) {
    _explanation = value;
  }

  Orders(this._id, this._name, this._explanation, this._price);

  Orders.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._explanation = map['explanation'];
    this._price = map['price'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['explanation'] = _explanation;
    map['price'] = _price;
    return map;
  }

  String toString() {
    return 'Orders{_id: $id, _name: $name, _explanation: $explanation, _price: $price}';
  }
}
