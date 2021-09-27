import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';
import 'package:lego_market_app/utils/utils_firebase.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text("Login"),
      ),
      backgroundColor: Colors.black,
      body: _SignInBody(),
    );
  }
}

class _SignInBody extends StatefulWidget {
  @override
  __SignInBodyState createState() => __SignInBodyState();
}

class __SignInBodyState extends State<_SignInBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        children: [
          //? sign in with Email & password
          _EmailPasswordForm(),
          //? sign in with google
          _SignInProvider(
            infoText: "Login in with google",
            buttonType: Buttons.Google,
            signInMethod: () async => _signInWithGoogle(),
          ),
          //? Anonimous login
          _SignInProvider(
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
      final User user = (await _auth.signInAnonymously()).user;
      Utils.showSnackBar(context, text: "Signed in anonymously: ${user.uid}");

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
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("${user.displayName}, Logged in with google."),
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

class _EmailPasswordForm extends StatefulWidget {
  @override
  __EmailPasswordFormState createState() => __EmailPasswordFormState();
}

class __EmailPasswordFormState extends State<_EmailPasswordForm> {
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
          padding: const EdgeInsets.fromLTRB(5, 80, 5, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? Bilgi
              Container(
                child: Text(
                  "Login with Email and Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
                alignment: Alignment.center,
              ),
              //? E-Mail
              TextFormField(
                cursorColor: Colors.white,
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "E-Mail",
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white),
                validator: (String mail) {
                  if (mail.isEmpty) return "Please write an e-mail";
                  return null;
                },
              ),
              //? Şifre
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white),
                validator: (String password) {
                  if (password.isEmpty) return "Please type a password";
                  return null;
                },
                obscureText: true, //! prevents passwords from appearing.
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
                alignment: Alignment.center,
                child: SignInButton(Buttons.Email, text: "Sign in with Email",
                    onPressed: () async {
                  if (_formKey.currentState.validate()) {
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

  /// [Email] ve [Password] ile kullanıcı girişi yapar.
  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} logged in with."),
      ));
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${e.message}"),
      ));

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
        content: Text("There was a problem logging in with Email and Password"),
      ));
    }
  }
}

class _SignInProvider extends StatefulWidget {
  final String infoText;
  final Buttons buttonType;
  final Function signInMethod;

  const _SignInProvider({
    Key key,
    @required this.infoText,
    @required this.buttonType,
    @required this.signInMethod,
  }) : super(key: key);

  @override
  __SignInProviderState createState() => __SignInProviderState();
}

class __SignInProviderState extends State<_SignInProvider> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 3, 5, 5),
              alignment: Alignment.center,
              child: SignInButton(
                widget.buttonType,
                text: widget.infoText,
                onPressed: () async => widget.signInMethod(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}