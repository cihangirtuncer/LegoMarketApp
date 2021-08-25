import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/orders_page/build_orders.dart';
import 'package:lego_market_app/core/components/orders_page/build_previous_orders.dart';
import 'package:lego_market_app/core/constant/row/home_app_bar_row.dart';

class BuildOrdersScreen extends StatefulWidget {
  const BuildOrdersScreen({Key? key}) : super(key: key);
  @override
  _BuildOrdersScreenState createState() => _BuildOrdersScreenState();
}

class _BuildOrdersScreenState extends State<BuildOrdersScreen>
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
                padding: const EdgeInsets.all(5),
                child: BuildOrders(context),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: BuildPreviousOrders(context),
              ),
            ),
          ],
        ));
  }
}
