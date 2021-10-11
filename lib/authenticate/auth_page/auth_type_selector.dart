import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lego_market_app/authenticate/login/email_password_form.dart';
import '../register/register_page.dart';
import '../../core/widget/gradient_container.dart';

class AuthTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildGradientContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailPasswordForm(),
            Container(
              child: SignInButtonBuilder(
                fontSize: 21,
                icon: Icons.person_add,
                backgroundColor: Color(0xFFB60707), //0xF541012C 0xF50876DD
                text: "Register", // 0xF51239E6
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
