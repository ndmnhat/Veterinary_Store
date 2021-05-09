import 'package:flutter/material.dart';
import 'package:veterinary_store_app/genaral_screens/sign_in/signin_screen.dart';
import 'package:veterinary_store_app/user/screens/transaction_history_screen.dart';
import 'package:veterinary_store_app/user/screens/change_info_user_screens/change_address_screen.dart';
import 'package:veterinary_store_app/user/screens/change_info_user_screens/change_info_user_screen.dart';
import 'package:veterinary_store_app/user/screens/change_info_user_screens/change_pass_screen.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(8, 12, 8, 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2),
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 60)
                      ),
                    ),
                    VerticalDivider(width: 26, thickness: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'User', 
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'user@gmail.com',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '0123456789',
                            style: TextStyle(fontSize: 18),
                          )
                        ]
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit), 
                      onPressed:(){_userInfoChange();},
                    )
                  ]),
                ),
                Divider(height: 30, thickness: 1),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total Bill Success:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 16),
                    )
                  ]
                ),
                Row(
                  children:[
                    Expanded(
                      child: Text(
                        'Total Money Cost:',
                        style: TextStyle(fontSize: 16)
                      ),
                    ),
                    Text(
                      '100.000 đ',
                      style: TextStyle(fontSize: 16)
                    )
                  ] 
                ),
              ] 
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2)
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction History", style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_tranHisScreen();},),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2)
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change Address", style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changeAddress();},),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2)
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change Password", style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changePass();},),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Color(0xFF0D9ABA)),
              onPressed: () {_signOut();},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Out",style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 20,
                  ),),],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tranHisScreen() {
    print('transaction_history');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TranHis()));
  }

  void _userInfoChange(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeInfo()));
  }

  void _changePass(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePass()));
  }

  void _changeAddress(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeAddress()));
  }

  void _signOut(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
          (Route<dynamic> route) => false,
    );
  }
}