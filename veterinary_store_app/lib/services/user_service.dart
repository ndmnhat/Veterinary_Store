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
    //dùng cho tạo hóa đơn :)))
    // await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").get().then((value) {
    //   for (DocumentSnapshot ds in value.docs){
    //     final Product product = Product.fromDocumentSnapshotForcart(documentSnapshot: ds);
    //     // ds.reference.delete();
    //     print("${product.name}");
    //
    //   };
    // });
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
      "iscancel": orderModel.isCancel,
      "iscomplete": orderModel.isComplete,
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

}
