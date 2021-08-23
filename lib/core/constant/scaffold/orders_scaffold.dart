import 'package:flutter/material.dart';

class OrdersAppBar extends StatefulWidget {
  const OrdersAppBar({Key? key}) : super(key: key);
  @override
  _OrdersAppBarState createState() => _OrdersAppBarState();
}

class _OrdersAppBarState extends State<OrdersAppBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "ORDERS",
              ),
              Tab(
                text: "PREVIOUS ORDERS",
              )
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 140),
            child: Text(
              "ORDERS",
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: userLogin(context),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: addMenu(context),
              ),
            ),
          ],
        ));
  }

  userLogin(BuildContext context) {
    return Center(
      child: Text("This is orders tab"),
    );
  }

  addMenu(BuildContext context) {
    return Center(
      child: Text("This is previous orders"),
    );
  }
}
