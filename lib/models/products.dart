class Products {
  int id;
  String name;
  int price;
  String explanation;

  Products(
    this.name,
    this.price,
    this.explanation,
  );
  Products.withID(
    this.id,
    this.name,
    this.explanation,
    this.price,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['explanation'] = explanation;
    map['price'] = price;
    return map;
  }

  Products.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.explanation = map['explanation'];
    this.price = map['price'];
  }

  String toString() {
    return 'Products{id: $id, name: $name, explanation: $explanation, price: $price}';
  }
}
