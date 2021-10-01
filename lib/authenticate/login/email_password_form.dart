import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lego_market_app/authenticate/login/login_view.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';

class EmailPasswordForm extends StatefulWidget {
  @override
  EmailPasswordFormState createState() => EmailPasswordFormState();
}

class EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
                child: Container(
                  child: Text(
                    "Login with Email and Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "E-mail",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                ),
                validator: (String? mail) {
                  if (mail!.isEmpty) return "Please write an e-mail";
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Password",
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white),
                validator: (String? password) {
                  if (password!.isEmpty) return "Please type a password";
                  return null;
                },
                obscureText: true, //! prevents passwords from appearing.
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                alignment: Alignment.center,
                child: SignInButton(Buttons.Email, text: "Login with Email",
                    onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _signInWithEmailAndPassword();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User? user = (await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user!.email} logged in with."),
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomHomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${e.message}"),
      ));
    } catch (e) {
      debugPrint(e.toString());
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("There was a problem logging in with Email and Password"),
      ));
    }
  }
}
