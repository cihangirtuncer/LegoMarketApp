import 'package:lego_market_app/utils/dbhelper.dart';

class Orders {
  late int id;
  late String name;
  late int price;
  late String explanation;

  Orders(this.id, this.name, this.explanation, this.price);

  Orders.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    explanation = map['explanation'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnPrice: price,
      DatabaseHelper.columnExplanation: explanation,
    };
  }
}
