import 'package:flutter/material.dart';

class ButtonPayment extends StatefulWidget {
  @override
  _ButtonPaymentState createState() => _ButtonPaymentState();
}

int volume = 1;

class _ButtonPaymentState extends State<ButtonPayment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.remove_outlined,
          ),
          onPressed: () {
            if (volume > 1) {
              setState(
                () {
                  volume -= 1;
                },
              );
            }
          },
        ),
        Text(
          "total: $volume",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add_outlined,
          ),
          onPressed: () {
            setState(() {
              volume += 1;
            });
          },
        ),
      ],
    );
  }
}
