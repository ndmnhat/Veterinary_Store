import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/models/user_model.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/screens/notification_screen.dart';
import 'package:veterinary_store_app/screens/payment_screen.dart';
import 'package:veterinary_store_app/screens/search_screen.dart';
import 'package:veterinary_store_app/screens/user_info_screen.dart';
import 'package:veterinary_store_app/screens/cart_screen.dart';
import 'package:veterinary_store_app/screens/health_care_screen.dart';
import 'package:veterinary_store_app/screens/home_screen.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AppScreen  extends GetWidget<UtilitiesController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double totalstemp;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UtilitiesController>(
        builder: (controller){
      return Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[50]),
          centerTitle: true,
          title: Text(controller.titleScreen, style: TextStyle(fontSize: 30,color: Colors.grey[50])),
          backgroundColor: Color(0xFF085B6E),
          bottom: controller.tabIndex == 0 ? PreferredSize(
            preferredSize: Size(35, 53),
            child: Container(
              child: Padding(
                padding: const  EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[50])
                    // backgroundColor: Colors.grey[50]
                  ),
                  onPressed: () { Get.to(SearchScreen());},
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[50], size: 30),],
                  ),
                ),
              ),
            ),
          ) : null,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.grey[50],
                  size: 35,
                ),
                onPressed: (){Get.to(NofiScreen());},
              ),
            ),
          ],
        ),
        body: GetBuilder<UtilitiesController>(
          init: UtilitiesController(),
          builder: (s) => IndexedStack(
            index: controller.tabIndex,
            children: [
              // ProductManagement(),
              HomeScreen(),
              HealthCare(),
              UserInfo(),
              CartScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: controller.tabIndex == 3 ? 115 : 57,
          decoration: BoxDecoration(
              color: Colors.grey[50],
              boxShadow: [
                BoxShadow(color: Colors.grey)
              ]
          ),
          child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                controller.tabIndex == 3 ?
                GetBuilder<AuthController>(
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
                          double TotalsPrice(){
                            double tempcounter = 0;
                            for(int i = 0;i<querySnapshot.size;i++){
                              final item1 = querySnapshot.docs[i];
                              final Product product1 = Product.fromQueryDocumentSnapshot(queryDocSnapshot: item1);
                              tempcounter += (int.parse(product1.quantum)*(double.parse(product1.price) - double.parse(product1.price)*double.parse(product1.discount)/100));
                            }
                            // print(tempcounter);
                            totalstemp = tempcounter;
                            return tempcounter;
                          }
                          final formatter = new NumberFormat("#,###");
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Totals: ", style: TextStyle(color: Colors.black,fontSize: 18,)),
                                    Text("${formatter.format(TotalsPrice())} vnđ",style: TextStyle(color: Colors.black,fontSize: 18,)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 5.0, 8.0, 10.0),
                                width: 100,
                                child: Container(
                                  height: 38,
                                  width: 80,
                                  child: OutlinedButton(
                                    onPressed: (){
                                      _payment();
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Color(0xFF085B6E),
                                    ),
                                    child: Text("Pay",style: TextStyle(color: Colors.grey[50], fontSize: 20,)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                    )
                ) : Row(),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey)
                      ]
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.local_hospital_outlined ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined ),
                        label: '',
                      ),
                    ],
                    currentIndex: controller.tabIndex,
                    onTap: controller.changeTabIndex,
                    elevation: 10,
                    iconSize: 35,
                    unselectedItemColor: Color(0xFF085B6E),
                    selectedItemColor: Color(0xFF0D9ABA),
                    selectedFontSize: 1.0,
                    unselectedFontSize: 1.0,
                    backgroundColor: Colors.grey[50],
                  ),
                ),]
          ),
        ),
      );}
    );
  }

  void _payment() {
    print("pay");
    if(totalstemp == 0){
      Get.snackbar("Nofitication", "No Product in you cart");
    }
    else{
      Get.to(Payment());
    }
  }
}
