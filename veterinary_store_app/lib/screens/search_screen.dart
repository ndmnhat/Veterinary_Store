import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';

class SearchScreen extends GetWidget<UtilitiesController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formatter = new NumberFormat("#,###");
  Stream<QuerySnapshot> streamQuery = Get.find<ProductController>().fetchProducts();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UtilitiesController>(
        builder: (controller){
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: TextField(
                  style: TextStyle(color:Colors.grey[50],fontSize: 18,decoration: TextDecoration.none),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey[50], size: 30),
                    hintText: "Search ...",
                    hintStyle: TextStyle(color: Colors.grey[50]),
                  ),
                  onChanged: (value){
                    print("${value}");
                    streamQuery = Get.find<ProductController>().searchProducts(value.toLowerCase());
                    controller.updateScreen();
                  }),
              backgroundColor: Color(0xFF085B6E),
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: streamQuery,
              builder: (context, stream) {
                if (stream.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (stream.hasError) {
                  return Center(child: Text(stream.error.toString()));
                }
                QuerySnapshot querySnapshot = stream.data;
                if(querySnapshot.size == 0){
                  return Center(child: Text("No products match"));
                }
                else{
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: Container(
                      child: StaggeredGridView.countBuilder(
                        //padding: EdgeInsets.all(10),
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 4,
                        itemCount: querySnapshot.size,
                        itemBuilder: (context, index)
                        {
                          final item = querySnapshot.docs[index];
                          // print(item.id);
                          // print("${controller.countDemo()}");
                          final Product product = Product.fromQueryDocumentSnapshot(queryDocSnapshot: item);
                          // print("${product.pathImage}");
                          // print("${product.id}");
                          return products(product);
                        },
                        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                    )
                  );
                }
              }
            )
          );
        }
    );
  }

  GestureDetector products(Product product){
    return GestureDetector(
      onTap: () {
        _changetodetail(product.id);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: SizedBox(
                height: 190,
                width: 250,
                child: Image.network("${product.pathImage}", fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("${product.name}", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 18,),),
                  ),
                ],
              ),
            ),
            //),
            int.parse(product.discount) == 0 ?
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("${formatter.format(double.parse(product.price))} vnđ", maxLines: 6, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 18,),),
                  ),
                ],
              ),
            ) : Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Expanded(
                    child: Text("${formatter.format((double.parse(product.price)-(double.parse(product.discount)/100*double.parse(product.price))))} vnđ", maxLines: 6, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 18,),),
                  ),
                ],
              ),
            ),
            int.parse(product.discount) == 0 ? Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("", maxLines: 6, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 18,),),
                  ),
                ],
              ),
            ) :
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("${formatter.format(double.parse(product.price))}", maxLines: 6, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 18,),),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _changetodetail(String idProduct) {
    print("detail");
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));
    Get.to(DetailProduct(idProduct));
  }
}
