import 'package:flutter/material.dart';

class ChangeAddress extends StatefulWidget {
  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> with SingleTickerProviderStateMixin {

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
          title: Text("Change Address", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: TextStyle(fontSize: 20)),
                SizedBox(height: 8),
                TextField(
                  // maxLines: 18,
                  // maxLength: 800,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8)
                  ),
                  // onChanged: (value) {
                  //   updateDescription();
                  // },
                ),
                SizedBox(height: 30),
                Text('Phone Number', style: TextStyle(fontSize: 20)),
                SizedBox(height: 8),
                TextField(
                  // maxLines: 18,
                  // maxLength: 800,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8)
                  ),
                  // onChanged: (value) {
                  //   updateDescription();
                  // },
                ),
                SizedBox(height: 30),
                Text('Address', style: TextStyle(fontSize: 20)),
                SizedBox(height: 8),
                TextField(
                  // maxLines: 18,
                  // maxLength: 800,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8)
                  ),
                  // onChanged: (value) {
                  //   updateDescription();
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}