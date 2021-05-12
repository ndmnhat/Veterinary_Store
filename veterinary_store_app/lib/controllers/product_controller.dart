import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinary_store_app/models/product_model.dart';
import 'package:veterinary_store_app/services/product_service.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProductController extends GetxController {
  RxInt _productListCount = 0.obs;
  RxInt get productListCount => _productListCount;
  void setproductListCount(int val) => _productListCount.value = val;

  final ProductService _productService = ProductService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Stream<QuerySnapshot> fetchProducts() {
    Stream<QuerySnapshot> qSnapStream =
    _productService.fetchProducts();
    return qSnapStream;
  }

  Stream<QuerySnapshot> searchProducts(String nameProduct) {
    Stream<QuerySnapshot> qSnapStream =
    _productService.searchProducts(nameProduct);
    return qSnapStream;
  }

  Stream<DocumentSnapshot> fetchProduct(String id) {
    Stream<DocumentSnapshot> dSnapStream =
    _productService.fetchProduct(id);
    return dSnapStream;
  }

  Future<void> createProduct(String name,String price, String discount,String quantum,File image) async {
    try {
      Product product = Product(
        name: name,
        price: price,
        discount: discount,
        quantum: quantum,
      );
      await _productService.createNewProduct(product, image);
      Get.back();
      Get.snackbar("","Add Product Successful");
    } catch (e) {
      Get.snackbar("Error",e);
    }
  }

  Future<void> updateProduct(String id,String name,String price,String discount,String quantum,String oldimage,File newimage) async {
    try {
      Product product = Product(
        id: id,
        name: name,
        price: price,
        discount: discount,
        pathImage: oldimage,
        quantum: quantum,
      );

      await _productService.updateProduct(product,newimage);
      Get.back();
      Get.snackbar("","Change Info Product Successful");
    } catch (e) {
      Get.snackbar("Error",e);
    }
  }

  Future<void> deleteProduct(String id,String image,String name) async {
    try {
      Product product = Product(
        id: id,
        name: name,
        pathImage: image,
      );
      await _productService.deleteProduct(product);
      Get.back();
      Get.snackbar("","Delete Product $name Successful");
    } catch (e) {
      Get.snackbar("Error",e);
    }
  }
}
