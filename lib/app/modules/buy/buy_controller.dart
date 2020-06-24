import 'dart:convert';

import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/buy/repositories/interfaces/buy_repository_interface.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  final HomeController _homeController;
  final ISharedLocalRepository _sharedLocalRepository;
  final IBuyRepository _buyRepository;

  @observable
  ObservableList<ProductModelStore> products;

  @observable
  double totalPriceOfAllProducts = 0;

  @observable
  bool isBusy = false;

  @observable
  String onSucess = '';

  @observable
  IconData icon = FontAwesomeIcons.times;

  @observable
  Color color = Colors.red;

  List<CoupomModel> coupons;

  List<CoupomModel> coupomFounded = [];

  _BuyControllerBase(
      this._homeController, this._sharedLocalRepository, this._buyRepository) {
    _getCoupons();
  }

  _getCoupons() async {
    coupons = await _buyRepository.getCoupons();
  }

  @action
  getProductsInCar() {
    var storeProductModel = ProductModelStore();

    products = _homeController.productsToCar
        .map((product) => storeProductModel.transformModel(product))
        .toList()
        .asObservable();

    ///print(products);
    _calcPriceOfAllProducts();
  }

  @action
  removeProductOfShoppingCar(ProductModelStore productModelStore) {
    if (products != null) {
      products.removeWhere((product) => product.id == productModelStore.id);

      _homeController.removeProductToCar(productModelStore.id);
    }
  }

  @action
  _calcPriceOfAllProducts() {
    products.map((product) {
      totalPriceOfAllProducts = totalPriceOfAllProducts + product.price;
    }).toList();

    print(totalPriceOfAllProducts);
  }

  @action
  calcPriceTotalByQuantity() {
    totalPriceOfAllProducts = 0.0;
    if (isBusy) {
      products.map((product) {
        totalPriceOfAllProducts += product.quantity * product.price;
      }).toList();
      totalPriceOfAllProducts -= coupomFounded[0].discount;
    } else {
      products.map((product) {
        totalPriceOfAllProducts += product.quantity * product.price;
      }).toList();
    }
    if (totalPriceOfAllProducts < 0) {
      print(totalPriceOfAllProducts);
      totalPriceOfAllProducts = 0.0;
    }
  }

  @action
  applyCoupomDiscount(String text) async {
    if (!isBusy && products.isNotEmpty) {
      coupomFounded = coupons.where((cupom) => cupom.title == text).toList();

      if (coupomFounded.isNotEmpty) {
        bool isMatched = await _verifyCupomInLocalStorage();

        if (isMatched) {
          _setMessage(
            isBusy: true,
            icon: FontAwesomeIcons.times,
            color: Colors.red,
            message: "Cupom já foi aplicado",
          );
          return;
        } else {
          if (totalPriceOfAllProducts <= coupomFounded[0].discount) {
            _setMessage(
              isBusy: true,
              icon: FontAwesomeIcons.times,
              color: Colors.red,
              message: "Preço total inferior ao desconto",
            );

            return;
          }

          totalPriceOfAllProducts =
              totalPriceOfAllProducts - coupomFounded[0].discount;

          _setMessage(
            isBusy: true,
            icon: FontAwesomeIcons.check,
            color: Colors.green,
            message: "Seu Cupom foi aplicado!",
          );

          saveCupons(coupomFounded[0]);
        }
      } else {
        _setMessage(
          isBusy: true,
          icon: FontAwesomeIcons.times,
          color: Colors.red,
          message: "Cupom inválido, tente outro",
        );

        return;
      }
    } else {
      _setMessage(
        isBusy: true,
        icon: FontAwesomeIcons.times,
        color: Colors.red,
        message: "Sem produtos no carrinho",
      );
    }
  }

  _setMessage({bool isBusy, Color color, IconData icon, String message}) {
    this.isBusy = isBusy;
    this.icon = icon;
    this.color = color;
    this.onSucess = message;
    if (color == Colors.green) {
      return;
    }
    Future.delayed(Duration(seconds: 2), () {
      this.isBusy = false;
    });
  }

  Future<bool> _verifyCupomInLocalStorage() async {
    bool isMatch = false;

    var couponsSaved = await loadCoupons();

    if (couponsSaved.isNotEmpty) {
      var matchCupons = couponsSaved
          .where((cupom) => coupomFounded[0].id == cupom.id)
          .toList();

      if (matchCupons.isNotEmpty) {
        isMatch = true;
      } else {
        isMatch = false;
      }
    }
    return isMatch;
  }

  saveCupons(CoupomModel cupomModel) async {
    var encondedCupom = jsonEncode(cupomModel);

    List cuponsLoaded = await _sharedLocalRepository.get('coupons') ?? [];

    List<String> listStrings = cuponsLoaded.map((e) => e.toString()).toList();

    print(listStrings);

    var isMatch = listStrings.where((cupom) => cupom == encondedCupom).toList();

    if (isMatch.isNotEmpty) {
      //print("Já existe esse cupom salvo");
      return;
    } else {
      //print("Não existe esse cupom salvo");

      listStrings.add(encondedCupom);

      await _sharedLocalRepository.insert('coupons', listStrings);
    }
  }

  Future<List<CoupomModel>> loadCoupons() async {
    List cupons = await _sharedLocalRepository.get('coupons');

    List<CoupomModel> coupons = [];

    //print(cupons);

    Map<String, dynamic> cuponsDecoded = {};

    if (cupons != null) {
      cupons.forEach((cupom) {
        cuponsDecoded = jsonDecode(cupom);
      });

      coupons =
          cupons.map((cupom) => CoupomModel.fromJson(cuponsDecoded)).toList();
    }

    return coupons;
  }

  remove() async {
    await _sharedLocalRepository.remove('coupons');
    List cupons = await _sharedLocalRepository.get('coupons');
    print(cupons);
  }
}
