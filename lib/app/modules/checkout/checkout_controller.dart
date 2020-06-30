import 'dart:convert';

import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/checkout/models/checkout_model.dart';
import 'package:annaluxstore/app/modules/checkout/repositories/order_repository_interface.dart';

import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @observable
  double cardHeigth = 0;
  @observable
  String cardNumber = "";
  @observable
  String cardHolder = "";
  @observable
  String cardExp = "";
  @observable
  IconData iconCard = FontAwesomeIcons.minus;
  @observable
  double opacity = 0;
  @observable
  String btnMessage = "Checar cartão";

  getUserInfos() async {
    user = await _authRepository.getUser();
  }

  createNewOrder(List<ProductModelStore> products) async {
    AdressModel adress = await _getUserAdress();
    if (adress != null && products != null) {
      var orderModel = CheckoutModel(
        userId: user.id,
        userName: user.name,
        userEmail: user.email,
        products: products,
        adress: adress,
        status: "",
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

  @action
  initCreditCard() {
    if (cardHeigth == 100) {
      cardHeigth = 200;

      Future.delayed(Duration(milliseconds: 370), () {
        opacity = 1;
        btnMessage = "Finalizar Pedido";
      });

      return;
    }
    Future.delayed(Duration(milliseconds: 250), () {
      opacity = 0;
      cardHeigth = 100;
      //TODO: FInalizar Compra e enviar pedido pro firebase;
    });
  }

  @action
  checkout(
      {String cardNumber, String cardHolder, String expDate, String secCode}) {
    this.cardNumber = cardNumber;
    this.cardHolder = cardHolder;
    this.cardExp = expDate;
    if (cardNumber.startsWith("5")) {
      iconCard = FontAwesomeIcons.ccMastercard;
    } else if (cardNumber.startsWith("4")) {
      iconCard = FontAwesomeIcons.ccVisa;
    } else {
      iconCard = FontAwesomeIcons.times;
    }
  }

  @action
  hideAndShowCard() {
    if (cardHeigth == 100) {
      cardHeigth = 200;
      Future.delayed(Duration(milliseconds: 370), () {
        opacity = 1;
      });

      return;
    }
    Future.delayed(Duration(milliseconds: 250), () {
      opacity = 0;
      cardHeigth = 100;
    });
  }
}
