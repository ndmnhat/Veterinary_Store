import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeAddress extends StatefulWidget {
  final String tempAddress;
  ChangeAddress(this.tempAddress);
  @override
  _ChangeAddressState createState() => _ChangeAddressState(this.tempAddress);
}

class _ChangeAddressState extends State<ChangeAddress> with SingleTickerProviderStateMixin {

  String tempAddress;
  _ChangeAddressState(this.tempAddress);

  final AuthController _userCtrl = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _addressInputCtrl = TextEditingController();

  void handleFormSubmit(context) async {
    if (_addressInputCtrl.text.isNotEmpty) {
      _userCtrl.updateAddressUser(
        id: _userCtrl.user.uid,
        address: _addressInputCtrl.text.trim(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _addressInputCtrl.text = tempAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[50]),
          centerTitle: true,
          title: Text("Đổi địa chỉ", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Địa chỉ', style: TextStyle(fontSize: 20)),
                SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  controller: _addressInputCtrl,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}