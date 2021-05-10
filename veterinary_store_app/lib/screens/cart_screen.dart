import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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

                  if(querySnapshot.size == 0){
                    return Center(child: Text("No Product in you cart"),);
                  }
                  else
                  {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.white,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                          itemCount: querySnapshot.size,
                          itemBuilder: (context, index) {
                            final item = querySnapshot.docs[index];
                            final Product product = Product.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                            return productincart(product);}),
                    );
                  }
                }
            )
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child:Container(
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children:[
                              IconButton(icon: new Icon(Icons.remove),onPressed: (){Get.find<AuthController>().removeProductInCart(product);}),
                              Text("${product.quantum}"),
                              IconButton(icon: new Icon(Icons.add),onPressed: (){Get.find<AuthController>().addProductInCart(product);}),
                            ],
                          ),
                          IconButton(icon: new Icon(Icons.delete),onPressed: (){Get.find<AuthController>().deleteProductFromCart(product);}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
