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
        centerTitle: true,
        // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
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
                  'Thông tin sản phẩm',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
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
                                child: Text('Tên')
                              ),
                              VerticalDivider(
                                width: 10.0,
                                color: Colors.grey,
                                
                              ),
                              Expanded(
                                child: Text('abc')
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Hướng dẫn sử dụng',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
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
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel enim velit. Nunc interdum libero non felis bibendum tempus. Proin.'),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Đánh giá sản phẩm',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
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
                                  Text('1465 nhận xét'),
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
                                  Text('5: 1323 nhận xét'),
                                  Text('4: 108 nhận xét'),
                                  Text('3: 26 nhận xét'),
                                  Text('2: 04 nhận xét'),
                                  Text('1: 04 nhận xét'),
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
                                          child: Text('Hot N*gga')
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Text('very good'),
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


              ]
            ),
          ]
        ),    
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyanAccent,
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: ElevatedButton(
            onPressed: (){},
            child: Text('Chọn mua'),
          ),
        ),
      ),
    );
  }
}