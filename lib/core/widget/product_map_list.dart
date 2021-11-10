import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';
import 'package:lego_market_app/product/product_list.dart';

List<Column> foodItemCreat(BuildContext context, List<Products> allFoodList) {
  return allFoodList
      .map(
        (product) => BuildProductList(
          context,
          product.name,
          product.explanation,
          product.price,
        ),
      )
      .toList();
}
