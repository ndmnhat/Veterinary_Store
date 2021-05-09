import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State< ChangePass> with SingleTickerProviderStateMixin {

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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[50]),
          centerTitle: true,
          title: Text("Change Pass", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
          backgroundColor: Color(0xFF085B6E),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                  size: 25,
                ),
                onPressed: (){},
              ),
            ),
          ],),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Old Password", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
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
              Text("New Password", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
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
              Text("Confirm New Password ", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              TextField(
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