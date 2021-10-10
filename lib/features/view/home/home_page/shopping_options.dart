import 'package:flutter/material.dart';
import '../../../../core/widget/gradient_container.dart';

import '../../../../core/widget/home_Screen_categories.dart';
import '../../../product_page/products/baby_care.dart';
import '../../../product_page/products/basic_food.dart';
import '../../../product_page/products/cigarettes.dart';
import '../../../product_page/products/dairy_and_breakfast.dart';
import '../../../product_page/products/drinks.dart';
import '../../../product_page/products/fit_form.dart';
import '../../../product_page/products/food.dart';
import '../../../product_page/products/fruits_veg.dart';
import '../../../product_page/products/home_care.dart';
import '../../../product_page/products/home_living.dart';
import '../../../product_page/products/ice_cream.dart';
import '../../../product_page/products/pastries.dart';
import '../../../product_page/products/personal_care.dart';
import '../../../product_page/products/pet_food.dart';
import '../../../product_page/products/ready_to_eat.dart';
import '../../../product_page/products/sexual_health.dart';
import '../../../product_page/products/snacks.dart';
import '../../../product_page/products/technology.dart';
import '../../../product_page/products/water.dart';

class ShoppingOptions extends StatefulWidget {
  @override
  _ShoppingOptionsState createState() => _ShoppingOptionsState();
}

class _ShoppingOptionsState extends State<ShoppingOptions> {
  @override
  Widget build(BuildContext context) {
    return BuildGradientContainer(
      GridView.count(
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
            "DRINKS",
            context,
            DrinksList(),
            "assets/images/drinks.png",
          ),
          BuildShoppingContainer(
            "ICE CREAM",
            context,
            IceCreamList(),
            "assets/images/icecream.png",
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
            "SNACKS",
            context,
            SnacksList(),
            "assets/images/snacks.jpg",
          ),
          BuildShoppingContainer(
            "BASIC FOOD",
            context,
            BasicFood(),
            "assets/images/basicfood.jpg",
          ),
          BuildShoppingContainer(
            "READY to EAT",
            context,
            ReadyToEatList(),
            "assets/images/readyfood.jpg",
          ),
          BuildShoppingContainer(
            "FIT FORM",
            context,
            FitFormList(),
            "assets/images/fitform.jpg",
          ),
          BuildShoppingContainer(
            "FRUİTS & VEG",
            context,
            FruitsVegList(),
            "assets/images/fruitsveg.jpg",
          ),
          BuildShoppingContainer(
            "BABY CARE",
            context,
            BabyCareList(),
            "assets/images/baby.jpg",
          ),
          BuildShoppingContainer(
            "PET FOODS",
            context,
            PetFoodList(),
            "assets/images/pet.jpg",
          ),
          BuildShoppingContainer(
            "HOME CARE",
            context,
            CleaningProductList(),
            "assets/images/cleaningproducts.jpg",
          ),
          BuildShoppingContainer(
            "PERSONAL CARE",
            context,
            PersonalCareList(),
            "assets/images/personalcare.jpg",
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
            "HOME LIVING",
            context,
            HomeLivingList(),
            "assets/images/lamp.jpg",
          ),
          BuildShoppingContainer(
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
