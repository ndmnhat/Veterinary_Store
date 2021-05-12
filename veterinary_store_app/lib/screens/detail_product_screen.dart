import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';

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
        backgroundColor: Color(0xFF085B6E),
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
                                  padding: EdgeInsets.all(8.0),
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
                                            child: Text(product.id, style: TextStyle(fontSize: 18),)
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
                          'Usage Instructions',
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
                          'Rates and Comments',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
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
                                            Text('1465 rates' , style: TextStyle(fontSize: 16),),
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
                                            Text('5: 1323 rates' , style: TextStyle(fontSize: 16),),
                                            Text('4: 108 rates' , style: TextStyle(fontSize: 16),),
                                            Text('3: 26 rates' , style: TextStyle(fontSize: 16),),
                                            Text('2: 04 rates' , style: TextStyle(fontSize: 16),),
                                            Text('1: 04 rates' , style: TextStyle(fontSize: 16),),
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
                                                          child: Text('Hot N*gga' , style: TextStyle(fontSize: 18),)
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
                                                  Text('very good' , style: TextStyle(fontSize: 16),),
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
                return BottomAppBar(
                  color: Colors.cyanAccent,
                  child: Container(
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
                          onPressed: (){Get.find<AuthController>().addProductToCart(product);},
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
              })),
    );
  }
}

