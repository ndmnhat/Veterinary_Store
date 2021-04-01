import 'package:flutter/material.dart';

class TranHis extends StatefulWidget {
  @override
  _TranHisState createState() => _TranHisState();
}

class _TranHisState extends State<TranHis> with SingleTickerProviderStateMixin {
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
          children: myTabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}