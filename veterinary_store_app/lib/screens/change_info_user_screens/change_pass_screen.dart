import 'package:flutter/material.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State< ChangePass> with SingleTickerProviderStateMixin {

  final AuthController _userCtrl = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _oldpassInputCtrl = TextEditingController();
  final TextEditingController _newpassInputCtrl = TextEditingController();
  final TextEditingController _newpassagainInputCtrl = TextEditingController();

  void handleFormSubmit(context) async {
    if (_oldpassInputCtrl.text.isNotEmpty && _newpassInputCtrl.text.isNotEmpty && _newpassagainInputCtrl.text.isNotEmpty && (_newpassInputCtrl.text == _newpassagainInputCtrl.text )) {
      _userCtrl.changepasswword(_oldpassInputCtrl.text, _newpassInputCtrl.text);
    }
    else if(_oldpassInputCtrl.text ==  _newpassInputCtrl.text){
      Get.snackbar("Lỗi", "Mật khẩu mới giống mật khẩu cũ");
    }
    else if(_newpassInputCtrl.text != _newpassagainInputCtrl.text ){
      Get.snackbar("Lỗi", "Mật khẩu nhập lại không đúng");
    }
  }

  @override
  void initState() {
    super.initState();
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
          title: Text("Đổi mật khẩu", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
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
          padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mật khẩu cũ", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
                controller: _oldpassInputCtrl,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              SizedBox(height: 30),
              Text("Mật khẩu mới", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
                controller: _newpassInputCtrl,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              SizedBox(height: 30),
              Text("Nhập lại mật khẩu mới", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
                controller: _newpassagainInputCtrl,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(8),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}