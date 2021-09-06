import 'package:flutter/material.dart';

class BakedGoods extends StatefulWidget {
  BakedGoods({Key key}) : super(key: key);

  @override
  _BakedGoodsState createState() => _BakedGoodsState();
}

class _BakedGoodsState extends State<BakedGoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baked Goods"),
      ),
      body: Container(),
    );
  }
}
