import 'package:flutter/material.dart';
import 'package:veterinary_store_app/user/screens/transaction_history_screen.dart';

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
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Info", style: TextStyle(fontSize: 18,),),
                Row(
                  children: [
                    Text("See more", style: TextStyle(fontSize: 18,),),
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_userInfoChange();}),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                Text("Name:   Demo", style: TextStyle(fontSize: 18,),),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                Text("Email:", style: TextStyle(fontSize: 18,),),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                Text("Phone:", style: TextStyle(fontSize: 18,),),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Text("Total Bill Success:", style: TextStyle(fontSize: 18,),),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                Text("Total Money Cost:", style: TextStyle(fontSize: 18,),),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change Address", style: TextStyle(fontSize: 18,),),
                Row(
                  children: [
                    Text("See more", style: TextStyle(fontSize: 18,),),
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changeAddress();},),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction History", style: TextStyle(fontSize: 18,),),
                Row(
                  children: [
                    Text("See more", style: TextStyle(fontSize: 18,),),
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_tranHisScreen();},),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change Password", style: TextStyle(fontSize: 18,),),
                Row(
                  children: [
                    Text("See more", style: TextStyle(fontSize: 18,),),
                    IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_changePass();},),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: OutlinedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.cyanAccent),),
              onPressed: () {},
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