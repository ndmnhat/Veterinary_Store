import 'package:flutter/material.dart';
import 'package:veterinary_store_app/screens/transaction_history_screen.dart';

import 'change_address_screen.dart';
import 'change_info_user_screen.dart';
import 'change_pass_screen.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("UserInfo"),
              Row(
                children: [
                  Text("See more"),
                  IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_userInfoChange();}),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text("Name:   Demo"),],
          ),
          Row(
            children: [
              Text("Email:"),],
          ),
          Row(
            children: [
              Text("Phone:"),],
          ),
          Row(
            children: [
              Text("Total Bill Success:"),],
          ),
          Row(
            children: [
              Text("Total Money Cost:"),],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change Address"),
              Row(
                children: [
                  Text("See more"),
                  IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changeAddress();},),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Transaction History"),
              Row(
                children: [
                  Text("See more"),
                  IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_tranHisScreen();},),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change Password"),
              Row(
                children: [
                  Text("See more"),
                  IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changePass();},),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: OutlinedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.cyanAccent),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Out",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),),],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tranHisScreen() {
    print("text");
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
}