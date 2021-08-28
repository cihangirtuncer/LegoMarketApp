import 'package:flutter/material.dart';

class ButtonPayment extends StatefulWidget {
  const ButtonPayment({Key? key}) : super(key: key);

  @override
  _ButtonPaymentState createState() => _ButtonPaymentState();
}

class _ButtonPaymentState extends State<ButtonPayment> {
  int _volume = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.remove_outlined),
          onPressed: () {
            if (_volume > 1) {
              setState(
                () {
                  _volume -= 1;
                },
              );
            }
          },
        ),
        Text(
          "total: $_volume",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add_outlined),
          onPressed: () {
            setState(() {
              _volume += 1;
            });
          },
        ),
      ],
    );
  }
}
