import 'package:annaluxstore/app/modules/checkout/models/checkout_model.dart';

abstract class IOrderRepository {
  Future<bool> createNewOrder(CheckoutModel orderModel);
}
