import 'package:flutter/material.dart';
import 'package:veterinary_store_app/admin/screens/product_management.dart';
import 'package:veterinary_store_app/screens/user_info_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  int _selectedIndex = 0;
  String _titleScreen = '';
  List <Widget> _widgetOptions = <Widget>[
    ProductManagement(),
    Text('Statistics'),
    UserInfo()
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        _titleScreen = 'Store Management';
      }
      else if(index == 1){
        _titleScreen = 'Statistics';
      }
      else if (index == 2){
        _titleScreen = 'Admin Information';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titleScreen, style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Colors.cyanAccent,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: ''
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        iconSize: 35,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.cyanAccent,
        selectedFontSize: 1.0,
        unselectedFontSize: 1.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}