import 'package:flutter/material.dart';
import 'package:veterinary_store_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: AppScreen(),
  ));
}

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  List <Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Reminder screen'),
    Text('Add screen'),
    Text('Profile screen'),
    Text('Cart screen'),

  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Veterinary Store')
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Reminder'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart' 
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}