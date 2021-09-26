import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/core/components/app_bar/home_app_bar.dart';
import 'package:lego_market_app/features/view/authenticate/register_page.dart';
import 'package:lego_market_app/features/view/authenticate/signin_page.dart';

/// Bir kimlik doğrulama türü [Authentication Type] seçmek için
/// bir UI [User Interface] sağlar.
class AuthTypeSelector extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      backgroundColor: Colors.indigo.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //? Kayıt Ol Buttonu
          Container(
            child: SignInButtonBuilder(
              fontSize: 20,
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: "Kayıt Ol",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
          ),
          //? Giriş Yap Buttonu
          Container(
            child: SignInButtonBuilder(
              fontSize: 20,
              icon: Icons.verified_user,
              backgroundColor: Colors.orange.shade800,
              text: "Giriş Yap",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _auth.currentUser == null
                      ? SignInPage()
                      : BottomHomePage(),
                ),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
