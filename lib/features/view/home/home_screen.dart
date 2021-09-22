import 'package:flutter/material.dart';

import '../../../core/components/app_bar/home_app_bar.dart';
import 'home_page/shopping_options.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: HomeAppBar(context),
      body: ShoppingOptions(),
    );
  }
}
