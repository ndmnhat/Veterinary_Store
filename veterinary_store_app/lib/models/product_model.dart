import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  List<Product> products;

  ProductModel({this.products});
}

class Product{
  String id;
  String name;
  String namelowercase;
  String price;
  String discount;
  String pathImage;
  String quantum;

  Product({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.pathImage,
    this.quantum,
  });

  Product.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    // id = documentSnapshot["id"];
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    namelowercase = documentSnapshot["namelowercase"];
    price = documentSnapshot["price"];
    discount = documentSnapshot["discount"];
    pathImage = documentSnapshot["path"];
    quantum = documentSnapshot["quantum"];
  }

  Product.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    namelowercase = data["namelowercase"] ;
    price = data["price"];
    discount = data["discount"];
    pathImage = data["path"];
    quantum = data["quantum"];
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    namelowercase = json["namelowercase"];
    price = json["price"];
    discount = json["discount"];
    pathImage = json["path"];
    quantum = json["quantum"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['namelowercase'] = this.namelowercase;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['path'] = this.pathImage;
    data['quantum'] = this.quantum;
    return data;
  }
}
