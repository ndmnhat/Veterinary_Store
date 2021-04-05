import 'package:flutter/material.dart';

import 'package:veterinary_store_app/screens/user_info_screen.dart';
import 'package:veterinary_store_app/screens/cart_screen.dart';
import 'package:veterinary_store_app/screens/health_care_screen.dart';
import 'package:veterinary_store_app/screens/home_screen.dart';

class TranHis extends StatefulWidget {
  @override
  _TranHisState createState() => _TranHisState();
}

class _TranHisState extends State<TranHis> with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Complete',
    ),
    Tab(
      text: 'Waiting',
    ),
    Tab(
      text: 'Cancel',
    ),
  ];

  List <Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HealthCare(),
    UserInfo(),
    CartScreen(),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(  // Added
      length: 4,  // Added
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("History", style: TextStyle(fontSize: 40,color: Colors.black)),
          backgroundColor: Colors.cyanAccent,
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 15),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
            children: [
              // sẽ thay thành hàm return về ds các đơn hàng
              HomeScreen(),
              HealthCare(),
              UserInfo(),
              CartScreen(),
            ],
        ),
      ),
    );
  }
}