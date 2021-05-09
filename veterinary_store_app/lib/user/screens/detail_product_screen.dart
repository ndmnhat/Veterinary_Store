import 'dart:ui';

import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[50]),
        centerTitle: true,
        // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Color(0xFF085B6E),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Image.network(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              ),
                            );
                          }
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Product Information',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Name', style: TextStyle(fontSize: 18),)
                              ),
                              VerticalDivider(
                                width: 10.0,
                                color: Colors.grey,
                                
                              ),
                              Expanded(
                                child: Text('abc', style: TextStyle(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Usage Instruction',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel enim velit. Nunc interdum libero non felis bibendum tempus. Proin.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Rates and Comments',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('1465 rates', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('5: 1323 rates', style: TextStyle(fontSize: 16),),
                                  Text('4: 108 rates', style: TextStyle(fontSize: 16),),
                                  Text('3: 26 rates', style: TextStyle(fontSize: 16),),
                                  Text('2: 04 rates', style: TextStyle(fontSize: 16),),
                                  Text('1: 04 rates', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        height: 200.0,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index){
                            return Card(
                              elevation: 1.0,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 15,
                                          child: Icon(Icons.person),
                                        ),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          child: Text('Hot N*gga', style: TextStyle(fontSize: 18),)
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Text('very good', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            );
                          }
                        )
                      ),
                    ],
                  )
                ),
                SizedBox(height: 30),
              ]
            ),
        ),    
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey)
          ]
        ),
        child: BottomAppBar(
          color: Colors.grey[50],
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Color(0xFF0D9ABA)),
              onPressed: (){},
              child: Text(
                'Add to cart', 
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 20
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}