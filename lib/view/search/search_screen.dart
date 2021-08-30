import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/search_page/build_search_screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return BuildSearchScreen();
  }
}
