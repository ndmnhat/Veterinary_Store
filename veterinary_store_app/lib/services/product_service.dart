import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:intl/intl.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firestorage = FirebaseStorage.instance;

  Stream<QuerySnapshot> fetchProducts() {
    return _firestore.collection("products").snapshots();
  }

  Stream<QuerySnapshot> searchProducts(String nameProduct) {
    return _firestore.collection("products").orderBy("namelowercase").startAt([nameProduct]).endAt([nameProduct + '\uf8ff']).snapshots();
  }

  Stream<DocumentSnapshot> fetchProduct(String productId) {
    return _firestore.collection("products").doc(productId.toString()).snapshots();
  }

  // String PriceProduct(String productId){
  //   _firestore.collection("products").get().then((value){
  //     // print("${value["price"]}");
  //     return value["price"].toString();
  //   });
  // }

  int countPro(){
    int temp = 0;
    _firestore.collection("products").get().then((value){
      temp++;
    });
    print("$temp");
    return temp;
  }

  Future<Product> createNewProduct(Product product,File image) async {
    Reference ref = _firestorage.ref().child(Path.basename(image.path));
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((fileURL) async {
        print(fileURL);
        await _firestore.collection("products").add({
          // "id": product.id,
          "name": product.name,
          "namelowercase": product.name.toLowerCase(),
          "price": product.price,
          "discount": product.discount,
          "path": fileURL.toString(),
          "quantum": product.quantum,
        });
      });
    });

    return product;
  }

  Future<Product> updateProduct(Product product,File image) async {
    if(image == null){
      DocumentReference docRef = _firestore.collection("products").doc(product.id);
      await docRef.update({
        "name": product.name,
        "namelowercase": product.name.toLowerCase(),
        "price": product.price,
        "discount": product.discount,
        "quantum": product.quantum,
      });
      // return product;
    }
    else{
      DocumentReference docRef = _firestore.collection("products").doc(product.id);
      var photo = _firestorage.refFromURL(product.pathImage);
      await photo.delete();
      Reference ref = _firestorage.ref().child(Path.basename(image.path));
      UploadTask uploadTask = ref.putFile(image);
      uploadTask.then((res){
        res.ref.getDownloadURL().then((fileURL) async {
          print(fileURL);
          await docRef.update({
            "name": product.name,
            "namelowercase": product.name.toLowerCase(),
            "price": product.price,
            "discount": product.discount,
            "path": fileURL.toString(),
            "quantum": product.quantum,
          });
        });
      });
      // return product;
    }
    return product;
  }

  Future<void> deleteProduct(Product product) async {
    var photo = _firestorage.refFromURL(product.pathImage);
    await photo.delete();
    await _firestore
        .collection("products")
        .doc(product.id)
        .delete();
  }
}
