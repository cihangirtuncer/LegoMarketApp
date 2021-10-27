import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../core/components/app_bar/bottom_navigation_bar.dart';
import '../../core/widget/gradient_container.dart';
import '../../core/widget/main_appBar.dart';

class RegisterPage extends StatefulWidget {
  final firestore = FirebaseFirestore.instance;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = true;
  final firestore = FirebaseFirestore.instance;

  // late String _message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          Text(
            "Join",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          true),
      body: buildGradientContainer(
        Padding(
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
                      validator: (String? nameSurname) {
                        if (nameSurname!.isEmpty) {
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
                      validator: (String? phone) {
                        if (phone!.isEmpty) {
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
                      validator: (String? address) {
                        if (address!.isEmpty) {
                          return "Please write an address";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                      validator: (String? mail) {
                        if (mail!.isEmpty) {
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
                      validator: (String? password) {
                        if (password!.isEmpty) {
                          return "please write an password";
                        }
                        return null;
                      },
                      obscureText:
                          true, //! prevents the password from appearing.
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 200,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFE49E07),
                              Color(0xF541012C),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: SignInButtonBuilder(
                          icon: Icons.person_add,
                          backgroundColor: Colors.transparent,
                          fontSize: 18,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                          text: "Register",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // ignore: unnecessary_null_comparison
                      child: Text(_success == null ? '' : " "),
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
    emailController.dispose();
    _passwordController.dispose();
    nameSurnameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }

  void _register() async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          _success = true;
        });
        Map<String, dynamic> usersData = {
          'name surname': nameSurnameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'address': addressController.text,
        };
        User? name = _auth.currentUser;
        CollectionReference usersRef = firestore.collection('users');
        await usersRef.doc(name!.uid.toString()).set(usersData);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomHomePage(),
          ),
        );
      } else {
        setState(() {
          _success = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _success = false;
      });
    }
  }
}
