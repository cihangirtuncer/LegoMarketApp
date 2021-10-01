import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lego_market_app/authenticate/login/login_view.dart';
import 'package:lego_market_app/authenticate/login/login_provider.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/core/widget/email_password_form.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/utils/utils_firebase.dart';

class SignInBody extends StatefulWidget {
  @override
  SignInBodyState createState() => SignInBodyState();
}

class SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return BuildGradientContainer(
      ListView(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        children: [
          EmailPasswordForm(),
          SignInProvider(
            infoText: "Login in with google",
            buttonType: Buttons.Google,
            signInMethod: () async => _signInWithGoogle(),
          ),
          SignInProvider(
            infoText: "Login anonymously",
            buttonType: Buttons.AppleDark,
            signInMethod: () async => _signInAnonymously(),
          ),
        ],
      ),
    );
  }

  void _signInAnonymously() async {
    try {
      final User? user = (await auth.signInAnonymously()).user;
      Utils.showSnackBar(context, text: "Signed in anonymously: ${user!.uid}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomHomePage(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("An error occurred while logging in anonymously")));
    }
  }

  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("${user!.displayName}, Logged in with google."),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomHomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.message}"),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred while logging in with Google!"),
        ),
      );
    }
  }
}
