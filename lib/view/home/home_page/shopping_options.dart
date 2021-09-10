import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/container/shopping_options_container.dart';
import '../products/baby_care.dart';
import '../products/pastries.dart';
import '../products/basic_food.dart';
import '../products/fit_form.dart';
import '../products/fruits_veg.dart';
import '../products/home_care.dart';
import '../products/cigarettes.dart';
import '../products/dairy_and_breakfast.dart';
import '../products/drinks.dart';
import '../products/food.dart';
import '../products/home_living.dart';
import '../products/ice_cream.dart';
import '../products/personal_care.dart';
import '../products/pet_food.dart';
import '../products/ready_to_eat.dart';
import '../products/sexual_health.dart';
import '../products/snacks.dart';
import '../products/technology.dart';
import '../products/water.dart';

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
