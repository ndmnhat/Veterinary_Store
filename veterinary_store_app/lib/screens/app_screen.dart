import 'package:flutter/material.dart';
import 'home_screen.dart';

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
        title: Text('Veterinary Store' ,style: TextStyle(fontSize: 45,color: Colors.black)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size(35, 35),
          child: Container(
            child: Padding(
              padding: const  EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: OutlinedButton(
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black, size: 30),],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 1.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          elevation: 1,
          iconSize: 35,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 1.0,
          unselectedFontSize: 1.0,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}