import 'package:flutter/material.dart';

import '../../widget/gradient_container.dart';
import '../../widget/main_appBar.dart';

buildProductsScaffold(String productName, List<Widget> children) {
  return Scaffold(
    appBar: mainAppBar(
        Text(
          productName,
        ),
        true),
    body: buildGradientContainer(
      ListView(
        physics: BouncingScrollPhysics(),
        children: children,
      ),
    ),
  );
}
