import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  var _formKey = GlobalKey<FormState>();
  // var _controller = TextEditingController();
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Colors.cyanAccent,
      ),   
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (String value){
                      if (value.length == 0)
                        return 'Please enter product name';
                      else return null;
                    },
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    validator: (String value){
                      if (value.length == 0)
                        return 'Please enter price';
                      else return null;
                    },
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      labelText: "Price",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    validator: (String value){
                      if (value.length == 0)
                        return 'Please enter producer';
                      else return null;
                    },
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      labelText: "Producer",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    validator: (String value){
                      if (value.length == 0)
                        return 'Please enter description';
                      else return null;
                    },
                    maxLines: 3,
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    validator: (String value){
                      if (value.length == 0)
                        return 'Please enter quantity';
                      else return null;
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black,fontSize: 25),
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Image',
                            labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        )
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() async {
                            // result = await FilePicker.platform.pickFiles();
                          });
                        }, 
                        child: Text('File Picker')
                      )
                    ],
                  )
                ]
              )
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _formKey.currentState.validate();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add', style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
              ]
            ),

          ],
        )
      )
    );
  }
}