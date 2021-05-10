import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String email;
  String phone;
  String address;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.address,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    phone = documentSnapshot["phone"];
    address = documentSnapshot["address"];
  }

  UserModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    name = data["name"];
    email = data["email"];
    phone = data["phone"];
    address = data["address"];
  }

  // UserModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
  //   var data = queryDocSnapshot.data();
  //   id = data["id"];
  //   name = data["name"];
  //   email = data["email"];
  //   phone = data["phone"];
  //   address = data["address"];
  // }
}
