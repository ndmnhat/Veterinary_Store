import 'package:flutter/material.dart';

class ChangeInfo extends StatefulWidget {
  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> with SingleTickerProviderStateMixin {

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
                onPressed: (){},
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
                  controller: TextEditingController(text: 'Johnny'),              
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
                  controller: TextEditingController(text: '0123456789'),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 32, 0, 8),
                child: Text("Email", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: TextEditingController(text: 'user@gmail.com'),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                  ) 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}