import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Stream<QuerySnapshot> fetchUser(String userId) {
  //   return _firestore
  //       .collection("users")
  //       .doc(userId.toString()).snapshots();
  // }

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
      final Product product = Product.fromDocumentSnapshot(documentSnapshot: snapShot);
      int temp = int.parse(product.quantum);
      temp++;
      await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).update({
        "quantum": temp.toString(),
      });
    }
    return product;
  }

  Future<Product> addProductInCart(Product product) async {
    final snapShot = await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).get();
    final Product productTemp = Product.fromDocumentSnapshot(documentSnapshot: snapShot);
    int temp = int.parse(productTemp.quantum);
    temp++;
    await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).update({
      "quantum": temp.toString(),
    });

    return product;
  }

  Future<Product> removeProductInCart(Product product) async {
    final snapShot = await _firestore.collection("users").doc(_fireAuth.currentUser.uid).collection("cartproduct").doc(product.id).get();
    final Product productTemp = Product.fromDocumentSnapshot(documentSnapshot: snapShot);
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


  // test demo
  Stream<QuerySnapshot> fetchProducts() {
    return _firestore.collection("products").snapshots();
  }
}
