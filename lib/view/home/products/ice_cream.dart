import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';
import 'package:lego_market_app/models/foods.dart';
import 'package:lego_market_app/services/category_service.dart';

class IcreCreamList extends StatefulWidget {
  @override
  _IcreCreamListState createState() => _IcreCreamListState();
}

class _IcreCreamListState extends State<IcreCreamList> {
  // ignore: unused_field
  var _foods = Foods();
  var _catagoryService = CategoryService();
  // ignore: deprecated_member_use
  List<Foods> _foodsList = List<Foods>();
  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    // ignore: deprecated_member_use
    _foodsList = List<Foods>();
    // ignore: unused_local_variable
    var categories = await _catagoryService.readCategories("Foods");
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
        "ICE CREAM",
        ListView.builder(
          itemCount: _foodsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _foodsList[index].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _foodsList[index].explanation,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  _foodsList[index].price.toString() + " TL",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
