import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lego_market_app/core/components/app_bar/bottom_navigation_bar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = true;
  String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF504094E),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
          child: Text(
            "Register",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Container(
        height: 1000,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xF541012C),
              Color(0xF504094E),
              Color(0xFF040C7C),
              Colors.teal,
              Color(0xFFE49E07),
              Color(0xFFE43307),
              Color(0xFF8D0505),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 90, 10, 30),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameSurnameController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: "Name/Surname",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (String nameSurname) {
                        if (nameSurname.isEmpty) {
                          return "Please write an name/surname ";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (String phone) {
                        if (phone.isEmpty) {
                          return "Please write an phone";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (String address) {
                        if (address.isEmpty) {
                          return "Please write an address";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (String mail) {
                        if (mail.isEmpty) {
                          return "Please write an e-mail";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (String password) {
                        if (password.isEmpty) {
                          return "please write an password";
                        }
                        return null;
                      },
                      obscureText:
                          true, //! prevents the password from appearing.
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: SignInButtonBuilder(
                        icon: Icons.person_add,
                        backgroundColor: Color(0xF504094E),
                        fontSize: 18,
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        text: "Register",
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(_success == null ? '' : _message ?? ''),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //! Clear controllers when widget is closed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Kayıt işlemi için
  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _message = "Registration Successful ${user.email}";
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomHomePage()));
      } else {
        setState(() {
          _success = false;
          _message = "Registration Failed.";
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _success = false;
        _message = "Registration Failed.\n\n$e";
      });
    }
  }
}
