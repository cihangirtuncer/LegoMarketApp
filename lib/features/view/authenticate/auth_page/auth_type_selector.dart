import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/core/widget/appbar_title.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/features/view/authenticate/register_page.dart';
import 'package:lego_market_app/features/view/authenticate/login_page.dart';

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
            child: BuildHomeAppBarText(38, 15),
            padding: const EdgeInsets.fromLTRB(3, 17, 3, 180),
          ),
          //? Login Button
          Container(
            child: SignInButtonBuilder(
              fontSize: 21,
              icon: Icons.verified_user,
              backgroundColor: Color(0xF5790101),
              text: "Login",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _auth.currentUser == null
                      ? SignInPage()
                      : BottomHomePage(),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 35),
            alignment: Alignment.center,
          ),
          //? register Button
          Container(
            child: SignInButtonBuilder(
              fontSize: 21,
              icon: Icons.person_add,
              backgroundColor: Color(0xF504094E),
              text: "Register",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 60),
            alignment: Alignment.center,
          ),
        ],
      ),
    ));
  }
}
