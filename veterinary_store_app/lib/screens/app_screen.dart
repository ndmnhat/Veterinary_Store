import 'package:flutter/material.dart';
import 'package:veterinary_store_app/screens/notification_screen.dart';
import 'package:veterinary_store_app/screens/user_info_screen.dart';
import 'package:veterinary_store_app/screens/cart_screen.dart';
import 'package:veterinary_store_app/screens/health_care_screen.dart';
import 'package:veterinary_store_app/screens/home_screen.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;
  String _titleScreen = 'Veterinary Store';
  List <Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HealthCare(),
    UserInfo(),
    CartScreen(),

  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        _titleScreen = 'Veterinary Store';
      }
      else if(index == 1){
        _titleScreen = 'HealthCare';
      }else if(index == 2){
        _titleScreen = 'User Information';
      }else if(index == 3){
        _titleScreen = 'Cart';
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
        bottom: _selectedIndex == 0 ? PreferredSize(
          preferredSize: Size(35, 35),
          child: Container(
            child: Padding(
              padding: const  EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: OutlinedButton(
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black, size: 30),],
                ),
              ),
            ),
          ),
        ) : null,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 35,
              ),
              onPressed: (){_nofi();},
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: _selectedIndex == 3 ? 110 : 57,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.tealAccent, width: 1.0))),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _selectedIndex == 3 ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello", style: TextStyle(color: Colors.black)),
                        Text("0 đ",style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: OutlinedButton(
                      child: Row(
                        children: [
                          Text("Pay",style: TextStyle(color: Colors.black)),
                          Icon(Icons.arrow_right_alt, color: Colors.black, size: 30),],
                      ),
                    ),
                  ),
                ],
              ) : Row(),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined ),
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
                backgroundColor: Colors.cyanAccent,
            ),]
          ),
        ),
    );
  }

  void _nofi() {
    print("text");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NofiScreen()));
  }

}