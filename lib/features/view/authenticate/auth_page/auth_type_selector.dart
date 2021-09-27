import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/core/widget/appbar_title/appbar_title.dart';
import 'package:lego_market_app/features/view/authenticate/register_page.dart';
import 'package:lego_market_app/features/view/authenticate/signin_page.dart';

/// Bir kimlik doğrulama türü [Authentication Type] seçmek için
/// bir UI [User Interface] sağlar.
class AuthTypeSelector extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xF54E0435),
              Color(0xF504094E),
              Color(0xF50010EE),
              Color(0xFFF7E708),
              Color(0xFFEC811E),
              Color(0xffee0000),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: BuildHomeAppBarText(38),
              padding: const EdgeInsets.fromLTRB(3, 17, 3, 180),
            ),
            //? Login Button
            Container(
              child: SignInButtonBuilder(
                fontSize: 20,
                icon: Icons.verified_user,
                backgroundColor: Colors.orange.shade900,
                text: "Login",
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => _auth.currentUser == null
                        ? SignInPage()
                        : BottomHomePage(),
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(3, 0, 3, 50),
              alignment: Alignment.center,
            ),
            //? register Button
            Container(
              child: SignInButtonBuilder(
                fontSize: 20,
                icon: Icons.person_add,
                backgroundColor: Colors.indigo.shade900,
                text: "Register",
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(3, 0, 3, 50),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
