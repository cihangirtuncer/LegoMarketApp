import 'package:flutter/material.dart';

import '../../../core/widget/gradient_container.dart';
import '../../../core/widget/info_container.dart';
import '../../../core/widget/main_appBar.dart';

class NullUserOrders extends StatefulWidget {
  const NullUserOrders({Key? key}) : super(key: key);

  @override
  State<NullUserOrders> createState() => _NullUserOrdersState();
}

class _NullUserOrdersState extends State<NullUserOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarExtMeth(),
      body: notUserBody(context),
    );
  }

  Widget notUserBody(BuildContext context) {
    return buildGradientContainer(
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
        child: Center(
          child: buildInfoContainer(
            context,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 80,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 25),
                  child: Text(
                    "Your basket is not visible because you are not a registered user, please log in or sign up.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBarExtMeth() {
    return mainAppBar(
      Text(
        "Basket",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      false,
    );
  }
}
