import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/container/shopping_options_container.dart';
import 'package:lego_market_app/view/home/products/baby_care.dart';
import 'package:lego_market_app/view/home/products/pastries.dart';
import 'package:lego_market_app/view/home/products/basic_food.dart';
import 'package:lego_market_app/view/home/products/fit_form.dart';
import 'package:lego_market_app/view/home/products/fruits_veg.dart';
import 'package:lego_market_app/view/home/products/home_care.dart';
import 'package:lego_market_app/view/home/products/cigarettes.dart';
import 'package:lego_market_app/view/home/products/dairy_and_breakfast.dart';
import 'package:lego_market_app/view/home/products/drinks.dart';
import 'package:lego_market_app/view/home/products/food.dart';
import 'package:lego_market_app/view/home/products/home_living.dart';
import 'package:lego_market_app/view/home/products/ice_cream.dart';
import 'package:lego_market_app/view/home/products/personal_care.dart';
import 'package:lego_market_app/view/home/products/pet_food.dart';
import 'package:lego_market_app/view/home/products/ready_to_eat.dart';
import 'package:lego_market_app/view/home/products/sexual_health.dart';
import 'package:lego_market_app/view/home/products/snacks.dart';
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
      crossAxisCount: 3,
      children: <Widget>[
        BuildShoppingContainer(
          "FOODS",
          context,
          FoodList(),
          "assets/images/food.png",
        ),
        BuildShoppingContainer(
          "ICE CREAM",
          context,
          IcreCreamList(),
          "assets/images/icecream.png",
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
          "assets/images/basicfood.jpg",
        ),
        BuildShoppingContainer(
          "PASTRIES",
          context,
          BakedGoods(),
          "assets/images/baked.jpg",
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
          "READY to EAT",
          context,
          ReadyToEat(),
          "assets/images/readyfood.jpg",
        ),
        BuildShoppingContainer(
          "PET FOOD",
          context,
          PetFood(),
          "assets/images/pet.jpg",
          //database yapılacak
        ),
        BuildShoppingContainer(
          "BABY CARE",
          context,
          BabyCare(),
          "assets/images/baby.jpg",
        ),
        BuildShoppingContainer(
          "HOME CARE",
          context,
          CleaningProductList(),
          "assets/images/cleaningproducts.jpg",
        ),
        BuildShoppingContainer(
          "SEX HEALTH",
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
          "assets/images/cigarettes.jpg",
        ),
        BuildShoppingContainer(
          "FIT FORM",
          context,
          FitForm(),
          "assets/images/fitform.jpg",
        ),
        BuildShoppingContainer(
          "HOME LIVING",
          context,
          HomeLiving(),
          "assets/images/lamp.jpg",
        ),
        BuildShoppingContainer(
          "PERSONAL CARE",
          context,
          PersonalCareList(),
          "assets/images/personalcare.jpg",
        ),
        BuildShoppingContainer(
          "FRUİTS & VEG",
          context,
          FruitsVeg(),
          "assets/images/fruitsveg.jpg",
        ),
        BuildShoppingContainer(
          "SNACKS",
          context,
          Snacks(),
          "assets/images/snacks.jpg",
        ),
      ],
    );
  }
}
