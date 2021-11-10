import 'package:flutter/material.dart';
import 'package:lego_market_app/product/products/baby_care.dart';
import 'package:lego_market_app/product/products/basic_food.dart';
import 'package:lego_market_app/product/products/cigarettes.dart';
import 'package:lego_market_app/product/products/dairy_and_breakfast.dart';
import 'package:lego_market_app/product/products/drinks.dart';
import 'package:lego_market_app/product/products/fit_form.dart';
import 'package:lego_market_app/product/products/food.dart';
import 'package:lego_market_app/product/products/fruits_veg.dart';
import 'package:lego_market_app/product/products/home_care.dart';
import 'package:lego_market_app/product/products/home_living.dart';
import 'package:lego_market_app/product/products/ice_cream.dart';
import 'package:lego_market_app/product/products/pastries.dart';
import 'package:lego_market_app/product/products/personal_care.dart';
import 'package:lego_market_app/product/products/pet_food.dart';
import 'package:lego_market_app/product/products/ready_to_eat.dart';
import 'package:lego_market_app/product/products/sexual_health.dart';
import 'package:lego_market_app/product/products/snacks.dart';
import 'package:lego_market_app/product/products/technology.dart';
import 'package:lego_market_app/product/products/water.dart';

import '../../../../core/widget/gradient_container.dart';
import '../../../../core/widget/home_Screen_categories.dart';

class ShoppingOptions extends StatefulWidget {
  @override
  _ShoppingOptionsState createState() => _ShoppingOptionsState();
}

class _ShoppingOptionsState extends State<ShoppingOptions> {
  @override
  Widget build(BuildContext context) {
    return buildGradientContainer(
      GridView.count(
        physics: BouncingScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        crossAxisCount: 3,
        children: <Widget>[
          buildShoppingContainer(
            "FOODS",
            context,
            FoodList(),
            "assets/images/food.png",
          ),
          buildShoppingContainer(
            "DRINKS",
            context,
            DrinksList(),
            "assets/images/drinks.png",
          ),
          buildShoppingContainer(
            "ICE CREAM",
            context,
            IceCreamList(),
            "assets/images/icecream.png",
          ),
          buildShoppingContainer(
            "PASTRIES",
            context,
            PastriesList(),
            "assets/images/baked.jpg",
          ),
          buildShoppingContainer(
            "BREAKFAST",
            context,
            DairyAndBreakfastList(),
            "assets/images/breakfast.jpg",
          ),
          buildShoppingContainer(
            "SNACKS",
            context,
            SnacksList(),
            "assets/images/snacks.jpg",
          ),
          buildShoppingContainer(
            "BASIC FOOD",
            context,
            BasicFood(),
            "assets/images/basicfood.jpg",
          ),
          buildShoppingContainer(
            "READY to EAT",
            context,
            ReadyToEatList(),
            "assets/images/readyfood.jpg",
          ),
          buildShoppingContainer(
            "FIT FORM",
            context,
            FitFormList(),
            "assets/images/fitform.jpg",
          ),
          buildShoppingContainer(
            "FRUİTS & VEG",
            context,
            FruitsVegList(),
            "assets/images/fruitsveg.jpg",
          ),
          buildShoppingContainer(
            "BABY CARE",
            context,
            BabyCareList(),
            "assets/images/baby.jpg",
          ),
          buildShoppingContainer(
            "PET FOODS",
            context,
            PetFoodList(),
            "assets/images/pet.jpg",
          ),
          buildShoppingContainer(
            "HOME CARE",
            context,
            CleaningProductList(),
            "assets/images/cleaningproducts.jpg",
          ),
          buildShoppingContainer(
            "PERSONAL CARE",
            context,
            PersonalCareList(),
            "assets/images/personalcare.jpg",
          ),
          buildShoppingContainer(
            "SEX HEALTH",
            context,
            SexualHealthList(),
            "assets/images/sexualhealth.jpg",
          ),
          buildShoppingContainer(
            "TECH",
            context,
            TechnologyList(),
            "assets/images/technology.jpg",
          ),
          buildShoppingContainer(
            "CIGARETTES",
            context,
            CigarettesList(),
            "assets/images/cigarettes.jpg",
          ),
          buildShoppingContainer(
            "HOME LIVING",
            context,
            HomeLivingList(),
            "assets/images/lamp.jpg",
          ),
          buildShoppingContainer(
            "WATER",
            context,
            WaterList(),
            "assets/images/water.jpg",
          ),
        ],
      ),
    );
  }
}
