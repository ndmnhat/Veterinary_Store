import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/models/order_model.dart';
import 'package:veterinary_store_app/models/product_model.dart';

Container transaction(OrderModel orderModel) {
  final formatter = new NumberFormat("#,###");
  int timeInMillis = orderModel.dateTimeOrder;
  var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
  var formattedDate = DateFormat.yMMMd().format(date);
  Container boxDetail() {
    if (orderModel.isCancel == true) {
      return Container(
        // color: Colors.green,
        width: 80.0,
        height: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Color(0xFF9E331B))),
          color: Color(0xFF9E331B),
        ),
        child: Text(
          "Cancel",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else if (orderModel.isCompleteAdmin == true &&
        orderModel.isCompleteUser == true) {
      return Container(
        width: 80.0,
        height: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Color(0xFF026E46))),
          color: Color(0xFF026E46),
        ),
        child: Text(
          "Complete",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Container(
        // color: Colors.green,
        width: 80.0,
        height: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Color(0xFF0D296E))),
          color: Color(0xFF0D296E),
        ),
        child: Text(
          "Waitting",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  return Container(
    width: Get.width * 0.94,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.white)),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: boxDetail(),
              ),
              Container(
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'ID Bill:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        '${orderModel.dateTimeOrder}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        'Day:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      '$formattedDate',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        'Receiver:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      '${orderModel.nameUser}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("Totals: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ),
                      Text(
                          "${formatter.format(double.parse(orderModel.totals))} vn??",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
