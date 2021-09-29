import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/features/view/authenticate/auth_page/auth_type_selector.dart';

// ignore: non_constant_identifier_names
BuildDrawer(BuildContext context) {
  return Drawer(
    child: BuildGradientContainer(
      ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Icon(
                Icons.account_circle_rounded,
                size: 120,
                color: Colors.white,
              )),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthTypeSelector()));
            },
            splashColor: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
