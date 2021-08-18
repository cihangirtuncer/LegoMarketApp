import 'package:flutter/material.dart';

class CigarettesList extends StatefulWidget {
  CigarettesList({Key? key}) : super(key: key);

  @override
  _CigarettesListState createState() => _CigarettesListState();
}

class _CigarettesListState extends State<CigarettesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Cigarettes"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
