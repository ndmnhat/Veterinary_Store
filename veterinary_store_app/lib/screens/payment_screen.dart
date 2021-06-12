import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/models/user_model.dart';
import 'package:veterinary_store_app/screens/app_screen.dart';

class Payment extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  UserModel user = UserModel();
  String useraddress;
  double totals;
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
                  user = UserModel.fromDocumentSnapshot(documentSnapshot: stream.data);
                  useraddress = user.address;
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
                                    'Thông tin người mua',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                        fontSize: 18),
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
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Địa chỉ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                color: Color(0xFFeaeaea),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Phương thức vận chuyển',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                                      value: "Shop tự vận chuyển",
                                                      groupValue: controller.selectRadioShipping,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioShipping(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Shop tự vận chuyển',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Giao hàng nhanh",
                                                      groupValue: controller.selectRadioShipping,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioShipping(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Giao hàng nhanh',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Ninja Van",
                                                      groupValue: controller.selectRadioShipping,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioShipping(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Ninja Van',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Bưu điện",
                                                      groupValue: controller.selectRadioShipping,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioShipping(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Bưu điện',
                                                    style: TextStyle(
                                                      fontSize: 18,
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
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Phương thức thanh toán',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                                      value: "Tiền mặt",
                                                      groupValue: controller.selectRadioPayment,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioPayment(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Tiền mặt',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio<String>(
                                                      value: "Thẻ",
                                                      groupValue: controller.selectRadioPayment,
                                                      activeColor: Color(0xFF085B6E),
                                                      onChanged: (val){
                                                        controller.setSelectRadioPayment(val);
                                                      }
                                                  ),
                                                  Text(
                                                    'Thẻ',
                                                    style: TextStyle(
                                                      fontSize: 18,
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
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Mã giảm giá',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                        width: Get.width*0.7,
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
                                          child: Text("Dùng",style: TextStyle(color: Colors.grey[50], fontSize: 18,)),
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
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Thông tin sản phẩm',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                color: Colors.grey[50],
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                                  child: Text(
                                    'Tổng tiền',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                              totals = tempcounter;
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
                      color: Color(0xFF085B6E),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: ElevatedButton(
                          onPressed: (){_pay();},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0D9ABA)
                          ),
                          child: Text('Thanh toán', style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                  );
                })
        )
    );
  }

  void _pay() {
    if(useraddress == ""){
      Get.snackbar("Thông báo", "Bạn chưa cài đặt địa chỉ nhận hàng");
    }
    else{
      Get.find<AuthController>().paythebill(user,totals.toString(),Get.find<UtilitiesController>().selectRadioShipping,Get.find<UtilitiesController>().selectRadioPayment);
    }
  }
}

void _changetodetail(String idProduct) {
  Get.to(()=>DetailProduct(idProduct));
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