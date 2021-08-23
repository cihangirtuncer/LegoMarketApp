import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/orders_page/build_orders.dart';
import 'package:lego_market_app/core/components/orders_page/build_previous_orders.dart';
import 'package:lego_market_app/core/constant/row/home_app_bar_row.dart';

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
            title: BuildHomeAppBarText()),
        body: TabBarView(
          controller: tabController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BuildOrders(context),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BuildPreviousOrders(context),
              ),
            ),
          ],
        ));
  }
}
