import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  List products;
  String orderStatus;
  Timestamp orderDate;

  OrderModel({
    this.orderStatus,
    this.products,
    this.orderDate,
  });

  factory OrderModel.fromJson(DocumentSnapshot doc) {
    return OrderModel(
      products: doc.data['products'],
      orderStatus: doc.data['orderStatus'],
      orderDate: doc.data['orderDate'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
