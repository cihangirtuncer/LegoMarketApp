import 'package:flutter/material.dart';
import '../../../features/model/products.dart';
import '../../../features/product_page/product_list.dart';

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
