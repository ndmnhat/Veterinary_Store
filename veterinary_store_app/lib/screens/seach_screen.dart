import 'package:flutter/material.dart';

class SeachProduct extends StatefulWidget {
  @override
  _SeachProductState createState() => _SeachProductState();
}

class _SeachProductState extends State<SeachProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body: Column(
            children: [
              Text("Seach"),
            ]
        ),
      ),
    );
  }
}