import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/container/shopping_options_container.dart';
import 'package:lego_market_app/view/home/products/basic_food.dart';
import 'package:lego_market_app/view/home/products/celaning_products.dart';
import 'package:lego_market_app/view/home/products/cigarettes.dart';
import 'package:lego_market_app/view/home/products/dairy_and_breakfast.dart';
import 'package:lego_market_app/view/home/products/drinks.dart';
import 'package:lego_market_app/view/home/products/food.dart';
import 'package:lego_market_app/view/home/products/ice_cream.dart';
import 'package:lego_market_app/view/home/products/personal_care.dart';
import 'package:lego_market_app/view/home/products/sexual_health.dart';
import 'package:lego_market_app/view/home/products/technology.dart';
import 'package:lego_market_app/view/home/products/water.dart';

class ShoppingOptions extends StatefulWidget {
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
          "assets/images/water.jpg",
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
          "assets/images/technology.jpg",
        ),
        BuildShoppingContainer(
          "CIGARETTES",
          context,
          CigarettesList(),
          "assets/images/cigarettes.png",
        ),
      ],
    );
  }
}
