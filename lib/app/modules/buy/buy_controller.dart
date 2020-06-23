import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  final HomeController _homeController;

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

  _BuyControllerBase(this._homeController) {
    _getCoupons();
  }

  Future _getCoupons() async {
    coupons = await _homeController.getCupons();
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
  }

  @action
  applyCoupomDiscount(String text) {
    if (!isBusy) {
      coupomFounded = coupons.where((cupom) => cupom.title == text).toList();
      //TODO: Verificar se o cupom bate com o cupom salvo offline
      /*Se o cupom digitado for igual ao do banco de dados e estiver salvo offline é por que
      o cupom ja foi usado.
      */
      print(coupomFounded);

      if (coupomFounded.isNotEmpty) {
        if (totalPriceOfAllProducts <= coupomFounded[0].discount) {
          _setMessage(
            isBusy: true,
            icon: FontAwesomeIcons.times,
            color: Colors.red,
            message: "Preço total inferior ao desconto",
          );
          print(onSucess);

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

        _homeController.coupons.removeWhere(
          (cupom) => cupom.id == coupomFounded[0].id,
          //TODO:Salvar offline os cupons já usados
        );
      } else {
        _setMessage(
          isBusy: true,
          icon: FontAwesomeIcons.times,
          color: Colors.red,
          message: "Cupom já foi aplicado ou inválido",
        );

        return;
      }
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
}
