import 'package:flutter/material.dart';

class NofiScreen extends StatefulWidget {
  @override
  _NofiScreenState createState() => _NofiScreenState();
}

class _NofiScreenState extends State<NofiScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Thông báo", style: TextStyle(fontSize: 30,color: Colors.grey[50])),
          backgroundColor: Color(0xFF085B6E),
        ),
        body: Column(
          children: [
            Text("Đang thi công"),
          ]
        ),
      ),
    );
  }
}