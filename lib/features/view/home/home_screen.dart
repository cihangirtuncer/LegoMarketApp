import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/drawer/drawer.dart';
import 'package:lego_market_app/core/widget/appbar_title.dart';
import 'home_page/shopping_options.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xF504094E),
        title: BuildHomeAppBarText(26, 10),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: BuildDrawer(context),
      body: ShoppingOptions(),
    );
  }
}
