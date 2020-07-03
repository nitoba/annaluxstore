import 'package:annaluxstore/app/modules/profile/models/order_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

abstract class IMyOrderRepository {
  Future<List<OrderModel>> getOrdersByUser(UserModel user);
}
