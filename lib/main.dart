import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/authenticate/auth_page/auth_type_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        hintColor: Colors.white,
        focusColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: AuthTypeSelector(),
    );
  }
}
