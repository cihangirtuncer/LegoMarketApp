import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/products_page/products/basic_food.dart';
import 'package:lego_market_app/core/components/products_page/products/celaning_products.dart';
import 'package:lego_market_app/core/components/products_page/products/cigarettes.dart';
import 'package:lego_market_app/core/components/products_page/products/dairy_and_breakfast.dart';
import 'package:lego_market_app/core/components/products_page/products/drinks.dart';
import 'package:lego_market_app/core/components/products_page/products/food.dart';
import 'package:lego_market_app/core/components/products_page/products/ice_cream.dart';
import 'package:lego_market_app/core/components/products_page/products/personal_care.dart';
import 'package:lego_market_app/core/components/products_page/products/sexual_health.dart';
import 'package:lego_market_app/core/components/products_page/products/technology.dart';
import 'package:lego_market_app/core/components/products_page/products/water.dart';
import 'package:lego_market_app/core/constant/container/shopping_options_container.dart';

class ShoppingOptions extends StatefulWidget {
  ShoppingOptions({Key? key}) : super(key: key);

  @override
  _ShoppingOptionsState createState() => _ShoppingOptionsState();
}

class _ShoppingOptionsState extends State<ShoppingOptions> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        BuildShoppingContainer(
          "FOODS",
          context,
          FoodList(),
          "assets/images/food.jpg",
        ),
        BuildShoppingContainer(
          "ICE CREAM",
          context,
          IcreCreamList(),
          "assets/images/icecream.jpg",
        ),
        BuildShoppingContainer(
          "WATER",
          context,
          WaterList(),
          "assets/images/water.png",
        ),
        BuildShoppingContainer(
          "BASIC FOOD",
          context,
          BasicFood(),
          "assets/images/basicfood.jpeg",
        ),
        BuildShoppingContainer(
          "DRINKS",
          context,
          DrinksList(),
          "assets/images/drinks.jpg",
        ),
        BuildShoppingContainer(
          "BREAKFAST",
          context,
          DairyAndBreakfastList(),
          "assets/images/breakfast.jpg",
        ),
        BuildShoppingContainer(
          "PERSONAL CARE",
          context,
          PersonalCareList(),
          "assets/images/personalcare.jpg",
        ),
        BuildShoppingContainer(
          "HOME CARE",
          context,
          CleaningProductList(),
          "assets/images/cleaningproducts.jpg",
        ),
        BuildShoppingContainer(
          "SEXUAL HEALTH",
          context,
          SexualHealthList(),
          "assets/images/sexualhealth.jpg",
        ),
        BuildShoppingContainer(
          "TECHNOLOGY",
          context,
          TechnologyList(),
          "assets/images/technology.jpeg",
        ),
        BuildShoppingContainer(
          "CIGARETTES",
          context,
          CigarettesList(),
          "assets/images/cigarettes.jpg",
        ),
      ],
    );
  }
}
