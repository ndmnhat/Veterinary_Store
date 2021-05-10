import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GetBuilder<ProductController>(
          builder: (_) =>
              StreamBuilder<QuerySnapshot>(
                stream: Get.find<ProductController>().fetchProducts(),
                builder: (context, stream) {
                  if (stream.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (stream.hasError) {
                    return Center(child: Text(stream.error.toString()));
                  }
                  QuerySnapshot querySnapshot = stream.data;
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                      child: Container(
                        child: StaggeredGridView.countBuilder(
                          //padding: EdgeInsets.all(10),
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 4,
                          itemCount: querySnapshot.size,
                          itemBuilder: (context, index) {
                            final item = querySnapshot.docs[index];
                            final Product product = Product
                                .fromQueryDocumentSnapshot(
                                queryDocSnapshot: item);
                            return products(product);
                          },
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      )
                  );
                },
              )
      ),
    );
  }

  GestureDetector products(Product product) {
    return GestureDetector(
      onTap: () {
        _changetodetail(product.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4)
          ],
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
                    child: Text(
                      "${product.name}", overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black, fontSize: 18,),),
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
                    child: Text(
                      "${formatter.format(double.parse(product.price))} vnđ",
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black, fontSize: 18,),),
                  ),
                ],
              ),
            ) : Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Expanded(
                    child: Text("${formatter.format((double.parse(product
                        .price) - (double.parse(product.discount) / 100 * double
                        .parse(product.price))))} vnđ", maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black, fontSize: 18,),),
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
                    child: Text("", maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 18,),),
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
                    child: Text(
                      "${formatter.format(double.parse(product.price))}",
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 18,),),
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
    Get.to(DetailProduct(idProduct));
  }
}