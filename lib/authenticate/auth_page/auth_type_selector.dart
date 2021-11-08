import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lego_market_app/core/components/navigator/push.dart';

import '../../core/widget/gradient_container.dart';
import '../login/email_password_form.dart';
import '../register/register_page.dart';

class AuthTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientContainer(
        Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 160, 10, 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailPasswordForm(),
                  Container(
                    child: SignInButtonBuilder(
                      fontSize: 21,
                      icon: Icons.person_add,
                      backgroundColor:
                          Color(0xF56E014E), //0xF541012C 0xFFB60707
                      text: "Register", // 0xF51239E6
                      onPressed: () => navigatorPush(
                        context,
                        RegisterPage(),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
