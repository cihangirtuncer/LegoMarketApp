import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lego_market_app/authenticate/login/login_view.dart';
import 'package:lego_market_app/authenticate/register/register_page.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/core/widget/appbar_title.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';

/// Bir kimlik doğrulama türü [Authentication Type] seçmek için
/// bir UI [User Interface] sağlar.
class AuthTypeSelector extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BuildGradientContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: BuildHomeAppBarText(45, 15),
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 200),
          ),

          //? Login Button
          Container(
            child: SignInButtonBuilder(
              fontSize: 21,
              icon: Icons.verified_user,
              backgroundColor: BuildColor(), //0xFF8D0505
              text: "Login",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _auth.currentUser == null
                      ? SignInPage()
                      : BottomHomePage(),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 30),
            alignment: Alignment.center,
          ),
          //? register Button
          Container(
            child: SignInButtonBuilder(
              fontSize: 21,
              icon: Icons.person_add,
              backgroundColor: Color(0xF541012C),
              text: "Register",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 110),
            alignment: Alignment.center,
          ),
        ],
      ),
    ));
  }
}
