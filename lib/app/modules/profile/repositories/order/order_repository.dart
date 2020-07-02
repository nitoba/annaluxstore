import 'package:annaluxstore/app/modules/profile/models/order_model.dart';
import 'package:annaluxstore/app/modules/profile/repositories/order/order_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrderRepository implements IMyOrderRepository {
  Firestore _instace = Firestore.instance;
  @override
  Future<List<OrderModel>> getOrdersByUser(UserModel userModel) async {
    List<OrderModel> orders = [];

    var ordersLoaded = await _instace
        .collection('orders')
        .where('userID', isEqualTo: userModel.id)
        .getDocuments();

    orders = ordersLoaded.documents
        .map((order) => OrderModel.fromJson(order))
        .toList();

    return orders;
  }
}
