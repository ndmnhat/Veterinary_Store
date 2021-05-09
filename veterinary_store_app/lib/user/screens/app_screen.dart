import 'package:flutter/material.dart';
import 'package:veterinary_store_app/user/screens/notification_screen.dart';
import 'package:veterinary_store_app/user/screens/payment_screen.dart';
import 'package:veterinary_store_app/user/screens/seach_screen.dart';
import 'package:veterinary_store_app/user/screens/user_info_screen.dart';
import 'package:veterinary_store_app/user/screens/cart_screen.dart';
import 'package:veterinary_store_app/user/screens/health_care_screen.dart';
import 'package:veterinary_store_app/user/screens/home_screen.dart';

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
      if(index == 0){_titleScreen = 'Veterinary Store';}
      else if(index == 1){_titleScreen = 'HealthCare';}
      else if(index == 2){_titleScreen = 'User Information';}
      else if(index == 3){_titleScreen = 'Cart';}
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[50]),
        centerTitle: true,
        title: Text(_titleScreen, style: TextStyle(fontSize: 30,color: Colors.grey[50])),
        backgroundColor: Color(0xFF085B6E),
        bottom: _selectedIndex == 0 ? PreferredSize(
          preferredSize: Size(35, 53),
          child: Container(
            child: Padding(
              padding: const  EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[50])
                  // backgroundColor: Colors.grey[50]
                ),
                onPressed: () { _seach();},
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[50], size: 30),],
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
                color: Colors.grey[50],
                size: 35,
              ),
              onPressed: (){_nofi();},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: Container(
        height: _selectedIndex == 3 ? 115 : 57,
        decoration: BoxDecoration(
          color: Colors.grey[50],
            boxShadow: [
              BoxShadow(color: Colors.grey)
            ]
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _selectedIndex == 3 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello", style: TextStyle(color: Colors.black,fontSize: 20,)),
                          Text("0 đ",style: TextStyle(color: Colors.black,fontSize: 20,)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5.0, 8.0, 5.0),
                      width: 100,
                      child: Container(
                        height: 38,
                        width: 80,
                        child: OutlinedButton(
                          onPressed: (){
                            _payment();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF085B6E),
                          ),
                          child: Text("Pay",style: TextStyle(color: Colors.grey[50], fontSize: 20,)),
                        ),
                      ),
                    ),
                  ],
              ) : Row(),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey)
                  ]
                ),
                child: BottomNavigationBar(
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
                  elevation: 10,
                  iconSize: 35,
                  unselectedItemColor: Color(0xFF085B6E),
                  selectedItemColor: Color(0xFF0D9ABA),
                  selectedFontSize: 1.0,
                  unselectedFontSize: 1.0,
                  backgroundColor: Colors.grey[50],

            ),
              ),]
          ),
        ),
    );
  }

  void _nofi() {
    print("nofi");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NofiScreen()));
  }

  void _seach() {
    print("seach");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeachProduct()));
  }

  void _payment() {
    print("pay");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Payment()));
  }

}