import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/drawer/drawer.dart';
import 'package:lego_market_app/core/widget/appbar_title.dart';
import 'package:lego_market_app/core/widget/color.dart';
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: BuildHomeAppBarText(26, 10),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFFB60707),
                Color(0xFFE49E07),
                // Color(0xF504094E),
              ],
            ),
          ),
        ),
      ),
      /*AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: BuildColor(),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: BuildHomeAppBarText(26, 10),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ), */
      drawer: BuildDrawer(context),
      body: ShoppingOptions(),
    );
  }
}
