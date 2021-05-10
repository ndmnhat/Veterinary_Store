import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/models/user_model.dart';

class Payment extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<AuthController>(
            builder: (_) => StreamBuilder<DocumentSnapshot>(
                stream: Get.find<AuthController>().fetchUser(),
                builder: (context, stream) {
                  if (stream.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (stream.hasError) {
                    return Center(child: Text(stream.error.toString()));
                  }
                  final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: stream.data);
                  return Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      backgroundColor: Color(0xFF085B6E),
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Detail User',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                                  child: Text(
                                    user.name,
                                    style: TextStyle(
                                      // fontFamily: 'Sans',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                                  child: Text(
                                    user.phone,
                                    style: TextStyle(
                                      // fontFamily: 'Sans',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                                  child: Text(
                                    user.address,
                                    style: TextStyle(
                                      // fontFamily: 'Sans',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Shipping Method',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Text(
                                    'Bla bla bla',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Payment Method',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: GetBuilder<UtilitiesController>(
                                    builder: (controller){
                                      return Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Cash",
                                                      groupValue: controller.selectRadio,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadio(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Cash',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Card",
                                                      groupValue: controller.selectRadio,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadio(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Card',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      );
                                    }
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Coupon discount',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width*0.75,
                                        height: 30,
                                        child: TextField(
                                          // maxLines: 1,
                                          // maxLength: 800,
                                          style: TextStyle(
                                              fontFamily: 'Sans',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Color(0xFF085B6E),
                                            side: BorderSide(width: 1, color: Color(0xFF085B6E),),),
                                          onPressed: (){},
                                          child: Text("Use",style: TextStyle(color: Colors.black,fontSize: 18,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Detail',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  child: GetBuilder<AuthController>(
                                      builder: (_) => StreamBuilder<QuerySnapshot>(
                                          stream: Get.find<AuthController>().fetchProductsFromCartUser(),
                                          builder: (context, stream) {
                                            if (stream.connectionState == ConnectionState.waiting) {
                                              return Center(child: CircularProgressIndicator());
                                            }
                                            if (stream.hasError) {
                                              return Center(child: Text(stream.error.toString()));
                                            }
                                            QuerySnapshot querySnapshot = stream.data;
                                            return Container(
                                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                              color: Colors.white,
                                              child: ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: querySnapshot.size,
                                                  itemBuilder: (context, index) {
                                                    final item = querySnapshot.docs[index];
                                                    final Product product = Product.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                                                    return productincart(product);}),
                                            );
                                          }
                                      )
                                  )
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                                  child: Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(top: BorderSide(color: Colors.black, width: 1.0))),
                                  child: GetBuilder<AuthController>(
                                      builder: (_) => StreamBuilder<QuerySnapshot>(
                                          stream: Get.find<AuthController>().fetchProductsFromCartUser(),
                                          builder: (context, stream) {
                                            if (stream.connectionState == ConnectionState.waiting) {
                                              return Center(child: CircularProgressIndicator());
                                            }
                                            if (stream.hasError) {
                                              return Center(child: Text(stream.error.toString()));
                                            }
                                            QuerySnapshot querySnapshot = stream.data;
                                            double totalsPrice(){
                                              double tempcounter = 0;
                                              for(int i = 0;i<querySnapshot.size;i++){
                                                final item1 = querySnapshot.docs[i];
                                                final Product product1 = Product.fromQueryDocumentSnapshot(queryDocSnapshot: item1);
                                                tempcounter += (int.parse(product1.quantum)*(double.parse(product1.price) - double.parse(product1.price)*double.parse(product1.discount)/100));
                                              }
                                              return tempcounter;
                                            }
                                            return Container(
                                              padding: EdgeInsets.all(8.0),
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2
                                                    ),
                                                  ]
                                              ),
                                              child: Text(
                                                "${formatter.format(totalsPrice())} vnđ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            );
                                          }
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    bottomNavigationBar: BottomAppBar(
                      color: Colors.cyanAccent,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('Pay'),
                        ),
                      ),
                    ),
                  );
                })
        )
    );
  }
}

void _changetodetail(String idProduct) {
  print("detail");
  Get.to(DetailProduct(idProduct));
}

GestureDetector productincart(Product product){
  final formatter = new NumberFormat("#,###");
  return GestureDetector(
    onTap: (){_changetodetail(product.id);},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * 0.94,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.white,
          // elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Container(
                  width: Get.width * 0.35,
                  height: Get.width * 0.35,
                  child: Image.network("${product.pathImage}", fit: BoxFit.fill, width: Get.width * 0.3, height: Get.width * 0.3,),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Text(
                        "${product.name}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: Container(
                      width: Get.width * 0.5,
                      child: Row(
                        children: [
                          int.parse(product.discount) == 0 ?
                          Text("${formatter.format(double.parse(product.price))} vnđ", style: TextStyle(color: Colors.black, fontSize: 18,),)
                              : Text("${formatter.format((double.parse(product.price)-(double.parse(product.discount)/100*double.parse(product.price))))} vnđ", style: TextStyle(color: Colors.black, fontSize: 18,),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Container(
                      width: Get.width * 0.5,
                      child: Row(
                        children: [
                          int.parse(product.discount) == 0 ? Text("")
                              : Text("${formatter.format(double.parse(product.price))}", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 18,),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text("${product.quantum}"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}