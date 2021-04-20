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
          centerTitle: true,
          title: Text("Change Address", style: TextStyle(fontSize: 30,color: Colors.black)),
          backgroundColor: Colors.cyanAccent,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: (){},
              ),
            ),
          ],),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                  child: TextField(
                    // maxLines: 18,
                    // maxLength: 800,
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 18),
                    // onChanged: (value) {
                    //   updateDescription();
                    // },
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