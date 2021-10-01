import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInProvider extends StatefulWidget {
  final String infoText;
  final Buttons buttonType;
  final Function signInMethod;

  const SignInProvider({
    Key? key,
    required this.infoText,
    required this.buttonType,
    required this.signInMethod,
  }) : super(key: key);

  @override
  SignInProviderState createState() => SignInProviderState();
}

class SignInProviderState extends State<SignInProvider> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 22),
            alignment: Alignment.center,
            child: SignInButton(
              widget.buttonType,
              text: widget.infoText,
              onPressed: () async => widget.signInMethod(),
            ),
          ),
        ],
      ),
    );
  }
}
