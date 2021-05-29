import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailProduct extends StatelessWidget {
  final String productId;
  DetailProduct(this.productId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Colors.cyanAccent,
      ),
      body:GetBuilder<ProductController>(
          builder: (_) => StreamBuilder<DocumentSnapshot>(
              stream: Get.find<ProductController>().fetchProduct(productId),
              builder: (context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                final Product product = Product.fromDocumentSnapshot(documentSnapshot: snapshot.data);
                return SingleChildScrollView(
                  padding: EdgeInsets.all(8.0),
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
                                  child: Image.network(product.pathImage),
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
                                            child: Text('Name')
                                        ),
                                        VerticalDivider(
                                          width: 10.0,
                                          color: Colors.grey,

                                        ),
                                        Expanded(
                                            child: Text(product.name)
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'Usage Instruction',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: Text('${product.howtouse}', style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'Rates and Comments',
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
                                            Text('1465 rates'),
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
                                            Text('5: 1323 rates'),
                                            Text('4: 108 rates'),
                                            Text('3: 26 rates'),
                                            Text('2: 04 rates'),
                                            Text('1: 04 rates'),
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
                );
              })
      ),
      bottomNavigationBar: GetBuilder<ProductController>(
          builder: (_) => StreamBuilder<DocumentSnapshot>(
              stream: Get.find<ProductController>().fetchProduct(productId),
              builder: (context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                final Product product = Product.fromDocumentSnapshot(documentSnapshot: snapshot.data);
                if(int.parse(product.quantum) == 0){
                  return BottomAppBar(
                    color: Colors.cyanAccent,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text('It Sold Out'),
                      ),
                    ),
                  );
                }
                else{
                  return BottomAppBar(
                    color: Colors.cyanAccent,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: ElevatedButton(
                        onPressed: (){Get.find<AuthController>().addProductToCart(product);},
                        child: Text('Add to cart'),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}

