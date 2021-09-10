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
      crossAxisSpacing: 11,
      mainAxisSpacing: 11,
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
          "SNACKS",
          context,
          SnacksList(),
          "assets/images/snacks.jpg",
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
          "DRINKS",
          context,
          DrinksList(),
          "assets/images/drinks.jpg",
        ),
        BuildShoppingContainer(
          "PASTRIES",
          context,
          PastriesList(),
          "assets/images/baked.jpg",
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
          ReadyToEatList(),
          "assets/images/readyfood.jpg",
        ),
        BuildShoppingContainer(
          "PET FOOD",
          context,
          PetFoodList(),
          "assets/images/pet.jpg",
        ),
        BuildShoppingContainer(
          "BABY CARE",
          context,
          BabyCareList(),
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
          "TECH",
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
          FitFormList(),
          "assets/images/fitform.jpg",
        ),
        BuildShoppingContainer(
          "HOME LIVING",
          context,
          HomeLivingList(),
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
          FruitsVegList(),
          "assets/images/fruitsveg.jpg",
        ),
      ],
    );
  }
}
