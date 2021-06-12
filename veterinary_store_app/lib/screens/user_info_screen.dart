import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/models/order_model.dart';
import 'package:veterinary_store_app/screens/transaction_history_screen.dart';
import 'package:veterinary_store_app/screens/change_info_user_screens/change_address_screen.dart';
import 'package:veterinary_store_app/screens/change_info_user_screens/change_info_user_screen.dart';
import 'package:veterinary_store_app/screens/change_info_user_screens/change_pass_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/models/user_model.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:GetBuilder<AuthController>(
        builder: (_) => StreamBuilder<DocumentSnapshot>(
          stream: Get.find<AuthController>().fetchUser(),
          builder: (context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2),
                        ]
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                    radius: 40,
                                    child: Icon(Icons.person, size: 60)
                                ),
                              ),
                              VerticalDivider(width: 26, thickness: 1),
                              Expanded(
                                flex: 3,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text(
                                        '${user.name}',
                                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${user.email}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        '${user.phone}',
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ]
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                  onPressed:() => Get.to(()=>ChangeInfo("${user.name}","${user.phone}"))),
                            ]),
                          ),
                          Divider(height: 30, thickness: 1),
                          Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Số đơn hàng thành công:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                    child: GetBuilder<AuthController>(
                                        builder: (_) => StreamBuilder<QuerySnapshot>(
                                            stream: Get.find<AuthController>().fetchOrdersComplete(),
                                            builder: (context, stream) {
                                              if (stream.connectionState == ConnectionState.waiting) {
                                                return Center(child: CircularProgressIndicator());
                                              }
                                              if (stream.hasError) {
                                                return Center(child: Text(stream.error.toString()));
                                              }
                                              QuerySnapshot querySnapshot = stream.data;
                                              return Container(
                                                child: Text(
                                                  "${querySnapshot.size}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              );
                                            }
                                        )
                                    )
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                  child: Text(
                                      'Tổng tiền đã tiêu:',
                                      style: TextStyle(fontSize: 16)
                                  ),
                                ),
                                Container(
                                    child: GetBuilder<AuthController>(
                                        builder: (_) => StreamBuilder<QuerySnapshot>(
                                            stream: Get.find<AuthController>().fetchOrdersComplete(),
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
                                                  final OrderModel order = OrderModel.fromQueryDocumentSnapshot(queryDocSnapshot: item1);
                                                  tempcounter += (double.parse(order.totals));
                                                }
                                                return tempcounter;
                                              }
                                              return Container(
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
                              ]
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lịch sử mua hàng", style: TextStyle(fontSize: 20)),
                        Row(
                          children: [
                            IconButton(icon: Icon(Icons.keyboard_arrow_right), onPressed:(){_tranHisScreen();},),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Đổi địa chỉ", style: TextStyle(fontSize: 20)),
                        Row(
                          children: [
                            IconButton(icon: Icon(Icons.keyboard_arrow_right),
                            onPressed:() => Get.to(()=>ChangeAddress("${user.address}"))),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Đổi mật khẩu", style: TextStyle(fontSize: 20)),
                        Row(
                          children: [
                            IconButton(icon: Icon(Icons.keyboard_arrow_right),
                            onPressed:(){_changePass();},),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(backgroundColor: Color(0xFF0D9ABA)),
                      onPressed: () {Get.find<AuthController>().signOutUser();},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Đăng xuất",style: TextStyle(
                            color: Colors.grey[50],
                            fontSize: 20,
                          ),),],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _tranHisScreen() {
    Get.to(()=>TranHis());
  }

  void _changePass(){
    Get.to(()=>ChangePass());
  }
}
