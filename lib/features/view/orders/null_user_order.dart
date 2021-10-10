import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

class NullUserOrders extends StatelessWidget {
  const NullUserOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        Text(
          "Orders",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        false,
      ),
      body: BuildGradientContainer(Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 40, 8, 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                color: Colors.white,
                size: 100,
              ),
              Text(
                "Your basket is not visible because you are not a registered user.Please log in or sign up.",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
