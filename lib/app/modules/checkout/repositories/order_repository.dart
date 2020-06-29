import 'package:annaluxstore/app/modules/checkout/models/checkout_model.dart';
import 'package:annaluxstore/app/modules/checkout/repositories/order_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository implements IOrderRepository {
  Firestore _firestore = Firestore.instance;
  final CollectionReference _ordersCollectionReference =
      Firestore.instance.collection("orders");
  @override
  Future<bool> createNewOrder(CheckoutModel orderModel) async {
    try {
      await _ordersCollectionReference.add(orderModel.toJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
