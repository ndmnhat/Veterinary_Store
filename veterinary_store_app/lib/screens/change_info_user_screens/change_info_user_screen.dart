import 'package:flutter/material.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ChangeInfo extends StatefulWidget {
  final String tempName;
  final String tempPhone;
  ChangeInfo(this.tempName,this.tempPhone);
  @override
  _ChangeInfoState createState() => _ChangeInfoState(this.tempName,this.tempPhone);
}

class _ChangeInfoState extends State<ChangeInfo> with SingleTickerProviderStateMixin {

  _ChangeInfoState(this.tempName,this.tempPhone);
  String tempName;
  String tempPhone;
  final AuthController _userCtrl = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameInputCtrl = TextEditingController();

  final TextEditingController _phoneInputCtrl = TextEditingController();

  void handleFormSubmit(context) async {
    if (_nameInputCtrl.text.isNotEmpty && _phoneInputCtrl.text.isNotEmpty) {
      _userCtrl.updateUser(
        id: _userCtrl.user.uid,
        name: _nameInputCtrl.text.trim(),
        phone: _phoneInputCtrl.text.trim(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameInputCtrl.text = tempName;
    _phoneInputCtrl.text = tempPhone;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[50]),
          centerTitle: true,
          title: Text("User info", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
          backgroundColor: Color(0xFF085B6E),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                  size: 25,
                ),
                onPressed: () => handleFormSubmit(context),
              ),
            ),
          ],),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 0, 8.0),
                child: Text("Name", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(

                  style: TextStyle(fontSize: 20),
                  controller: _nameInputCtrl,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 32, 0, 8),
                child: Text("Phone", style: TextStyle(fontSize: 20))
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: _phoneInputCtrl,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}