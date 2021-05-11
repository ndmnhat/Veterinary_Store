import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String id;
  String idUser;
  String nameUser;
  String emailUser;
  String phoneUser;
  String addressUser;
  String shippingMethod;
  String paymentMethod;
  bool isCancel;
  bool isComplete;
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
    this.isCancel,
    this.isComplete,
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
    isCancel = documentSnapshot["iscancel"];
    isComplete = documentSnapshot["iscomplete"];
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
    isCancel = data["iscancel"];
    isComplete = data["iscomplete"];
    isAccess = data["isaccess"];
    isShipping = data["isshipping"];
  }

}
