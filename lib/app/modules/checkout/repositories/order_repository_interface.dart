import 'package:annaluxstore/app/modules/checkout/models/checkout_model.dart';
import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

abstract class IOrderRepository {
  Future<bool> createNewOrder(CheckoutModel orderModel);
  Future<AdressModel> getUserAdressInDatabase(UserModel userModel);
}
