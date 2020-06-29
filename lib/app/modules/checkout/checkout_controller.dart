import 'dart:convert';

import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/checkout/models/checkout_model.dart';
import 'package:annaluxstore/app/modules/checkout/repositories/order_repository_interface.dart';

import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'checkout_controller.g.dart';

class CheckoutController = _CheckoutControllerBase with _$CheckoutController;

abstract class _CheckoutControllerBase with Store {
  final IOrderRepository _orderRepository;
  final IAuthRepository _authRepository;

  UserModel user;
  _CheckoutControllerBase(this._orderRepository, this._authRepository) {
    getUserInfos();
  }

  getUserInfos() async {
    user = await _authRepository.getUser();
  }

  createNewOrder(List<ProductModelStore> products) async {
    AdressModel adress = await _getUserAdress();
    if (adress != null && products != null) {
      var orderModel = CheckoutModel(
        user: user,
        products: products,
        adress: adress,
      );
      await _orderRepository.createNewOrder(orderModel);
    }
  }

  Future<AdressModel> _getUserAdress() async {
    AdressModel adress;
    if (user != null) {
      var adressLoaded = await _orderRepository.getUserAdressInDatabase(user);
      if (adressLoaded != null) {
        adress = adressLoaded;
      }
    }

    return adress;
  }
}
