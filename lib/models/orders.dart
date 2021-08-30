class Orders {
  int _id;
  String _name;
  int _price;
  String _explanation;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get explanation => _explanation;

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
