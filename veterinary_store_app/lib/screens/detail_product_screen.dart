import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Column(
            children: [
              Text("Detail product"),
            ]
        ),
      ),
    );
  }
}