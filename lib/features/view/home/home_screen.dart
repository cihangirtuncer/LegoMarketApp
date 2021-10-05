import 'package:flutter/material.dart';
import '../../../core/widget/appbar_title.dart';
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
        title: BuildHomeAppBarText(30, 10),
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
      body: ShoppingOptions(),
    );
  }
}
