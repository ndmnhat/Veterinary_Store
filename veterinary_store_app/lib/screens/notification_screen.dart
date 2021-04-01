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
          title: Text("Nofitications", style: TextStyle(fontSize: 30,color: Colors.black)),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Column(
          children: [
            Text("Hihi"),
          ]
        ),
      ),
    );
  }
}