import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel {
  String id;
  String idUser;
  String nameUser;
  String emailUser;
  String phoneUser;
  String addressUser;
  String shippingMethod;
  String paymentMethod;
  String totals;
  int dateTimeOrder;
  bool isCancel;
  bool isCompleteUser;
  bool isCompleteAdmin;
  bool isWaitting;
  bool isAccess;
  bool isShipping;

  OrderModel({
    this.id,
    this.idUser,
    this.nameUser,
    this.emailUser,
    this.phoneUser,
    this.addressUser,
    this.shippingMethod,
    this.paymentMethod,
    this.totals,
    this.dateTimeOrder,
    this.isCancel,
    this.isCompleteUser,
    this.isCompleteAdmin,
    this.isWaitting,
    this.isAccess,
    this.isShipping,
  });

  OrderModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    idUser = documentSnapshot["iduser"];
    nameUser = documentSnapshot["nameuser"];
    emailUser = documentSnapshot["emailuser"];
    phoneUser = documentSnapshot["phoneuser"];
    addressUser = documentSnapshot["addressuser"];
    shippingMethod = documentSnapshot["shippingmethod"];
    paymentMethod = documentSnapshot["paymentmethod"];
    totals = documentSnapshot["totals"];
    dateTimeOrder = documentSnapshot["datetimeorder"];
    isCancel = documentSnapshot["iscancel"];
    isCompleteUser = documentSnapshot["iscompleteuser"];
    isCompleteAdmin = documentSnapshot["iscompleteadmin"];
    isWaitting = documentSnapshot["iswaitting"];
    isAccess = documentSnapshot["isaccess"];
    isShipping = documentSnapshot["isshipping"];

  }

  OrderModel.fromQueryDocumentSnapshot({QueryDocumentSnapshot queryDocSnapshot}) {
    var data = queryDocSnapshot.data();
    id = queryDocSnapshot.id;
    idUser = data["iduser"];
    nameUser = data["nameuser"];
    emailUser = data["emailuser"];
    phoneUser = data["phoneuser"];
    addressUser = data["addressuser"];
    shippingMethod = data["shippingmethod"];
    paymentMethod = data["paymentmethod"];
    totals = data["totals"];
    dateTimeOrder = data["datetimeorder"];
    isCancel = data["iscancel"];
    isCompleteUser = data["iscompleteuser"];
    isCompleteAdmin = data["iscompleteadmin"];
    isWaitting = data["iswaitting"];
    isAccess = data["isaccess"];
    isShipping = data["isshipping"];
  }

}
