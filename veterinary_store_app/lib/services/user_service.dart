import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/models/order_model.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:get/get.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  Future<UserModel> createNewUser(UserModel user) async {
    await _firestore.collection("users").doc(user.id).set({
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "address": user.address,
    });
    return user;
  }

  Future<UserModel> getUser(UserModel user) async {
    await _firestore.collection("users").doc(user.id).get();
    return user;
  }

  Stream<DocumentSnapshot> fetchUser(String userId) {
    return _firestore
        .collection("users")
        .doc(userId.toString()).snapshots();
  }

  Future<UserModel> updateUser(UserModel user) async {
    DocumentReference docRef = _firestore.collection("users").doc(user.id);

    await docRef.update({
      "name": user.name,
      "phone": user.phone
    });
    return user;
  }

  Future<UserModel> updateAddressUser(UserModel user) async {
    DocumentReference docRef = _firestore.collection("users").doc(user.id);

    await docRef.update({
      "address": user.address
    });
    return user;
  }
  // cart product
  Stream<QuerySnapshot> fetchProductsFromCartUser(){
    return _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").snapshots();
  }

  Future<Product> addProductToCart(Product product) async {
    final snapShot = await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).get();
    if (snapShot == null || !snapShot.exists) {
      await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).set({
        "name": product.name,
        "price": product.price,
        "discount": product.discount,
        "path": product.pathImage,
        "quantum": "1",
      });
    }
    else{
      final Product productTemp = Product.fromDocumentSnapshotForcart(documentSnapshot: snapShot);
      int temp = int.parse(productTemp.quantum);
      temp++;
      await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).update({
        "quantum": temp.toString(),
      });
    }
    return product;
  }

  Future<Product> addProductInCart(Product product) async {
    final snapShot = await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).get();
    final Product productTemp = Product.fromDocumentSnapshotForcart(documentSnapshot: snapShot);
    int temp = int.parse(productTemp.quantum);
    temp++;
    await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).update({
      "quantum": temp.toString(),
    });

    return product;
  }

  Future<Product> removeProductInCart(Product product) async {
    final snapShot = await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).get();
    final Product productTemp = Product.fromDocumentSnapshotForcart(documentSnapshot: snapShot);
    int temp = int.parse(productTemp.quantum);
    if(temp == 1){
      await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).delete();
    }
    else{
      temp--;
      await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).update({
        "quantum": temp.toString(),
      });
    }
    return product;
  }

  Future<void> deleteProductFromCart(Product product) async {
    await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).delete();
  }
  // thanh toán
  Future<void> paythebill(OrderModel orderModel) async {
    await _firestore.collection("orders").add({
      "iduser": orderModel.idUser,
      "nameuser": orderModel.nameUser,
      "emailuser": orderModel.emailUser,
      "phoneuser": orderModel.phoneUser,
      "addressuser": orderModel.addressUser,
      "shippingmethod": orderModel.shippingMethod,
      "paymentmethod": orderModel.paymentMethod,
      "totals": orderModel.totals,
      "datetimeorder": DateTime.now().toUtc().millisecondsSinceEpoch,
      "iscancel": orderModel.isCancel,
      "iscompleteuser": orderModel.isCompleteUser,
      "iscompleteadmin": orderModel.isCompleteAdmin,
      "iswaitting": orderModel.isWaitting,
      "isaccess": orderModel.isAccess,
      "isshipping": orderModel.isShipping,
    }).then((valueorder) async {
      await _firestore.collection("users").doc(orderModel.idUser).collection("cartproduct").get().then((value) async {
        for (DocumentSnapshot ds in value.docs){
          final Product product = Product.fromDocumentSnapshotForcart(documentSnapshot: ds);
          await _firestore.collection("orders").doc(valueorder.id).collection("cartproduct").doc(product.id).set({
            "name": product.name,
            "price": product.price,
            "discount": product.discount,
            "path": product.pathImage,
            "quantum": product.quantum,
          });
          ds.reference.delete();
        };
      });
    });
  }
  // lịch sử mua hàng
  Stream<DocumentSnapshot> fetchOrder(String idorder) {
    return _firestore.collection("orders").doc(idorder).snapshots();
  }

  Stream<QuerySnapshot> fetchOrdersAll() {
    return _firestore.collection("orders").where('iduser', isEqualTo: _fireAuth.currentUser.uid).orderBy("datetimeorder",descending: true).snapshots();
  }

  Stream<QuerySnapshot> fetchOrdersWaitting() {
    return _firestore.collection("orders").where('iduser',isEqualTo: _fireAuth.currentUser.uid).where('iscancel', isEqualTo: false).where('iswaitting', isEqualTo: true).orderBy("datetimeorder",descending: true).snapshots();
  }

  Stream<QuerySnapshot> fetchOrdersComplete() {
    return _firestore.collection("orders").where('iduser', isEqualTo: _fireAuth.currentUser.uid).where('iscancel', isEqualTo: false).where('iscompleteuser', isEqualTo: true).where('iscompleteadmin', isEqualTo: true).orderBy("datetimeorder",descending: true).snapshots();
  }

  Stream<QuerySnapshot> fetchOrdersCancel() {
    return _firestore.collection("orders").where('iduser', isEqualTo: _fireAuth.currentUser.uid).where('iscancel', isEqualTo: true).orderBy("datetimeorder",descending: true).snapshots();
  }

  Stream<QuerySnapshot> fetchProductsFromOrder(String idorrder) {
    return _firestore.collection("orders").doc(idorrder).collection("cartproduct").snapshots();
  }

  Future<void> cancelOrder(String idorder) async {
    await _firestore.collection("orders").doc(idorder).update({
      "iscancel" : true,
      "iswaitting": false,
    });
  }

  Future<void> completeOrder(String idorder) async {
    final snapShot = await _firestore.collection("orders").doc(idorder).get();
    final OrderModel order = OrderModel.fromDocumentSnapshot(documentSnapshot: snapShot);
    if(order.isCompleteAdmin == true){
      await _firestore.collection("orders").doc(idorder).update({
        "iscompleteuser" : true,
        "iswaitting" : false,
      });
    }
    else if(order.isCompleteAdmin == false) {
      await _firestore.collection("orders").doc(idorder).update({
        "iscompleteuser" : true,
      });
    }

  }

}
