import 'dart:convert';

import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'product_detail_controller.g.dart';

class ProductDetailController = _ProductDetailControllerBase
    with _$ProductDetailController;

abstract class _ProductDetailControllerBase with Store {
  final HomeController _homeController;
  final ISharedLocalRepository _sharedLocalRepository;

  @observable
  String messageBtn = "Adicionar ao carrinho";

  @observable
  IconData icon = FontAwesomeIcons.shoppingCart;

  @observable
  IconData iconFavorite = FontAwesomeIcons.heart;

  @observable
  Color color = thirdColor;
  @observable
  bool isAdd = false;

  _ProductDetailControllerBase(
      this._homeController, this._sharedLocalRepository);

  @action
  addToShoppingCar(ProductModel productModel) {
    var productFound = _filterProductToCart(productModel);

    if (productFound.isEmpty) {
      _homeController.addProductToCar(productModel);
      icon = FontAwesomeIcons.check;
      color = Colors.green;
      isAdd = true;
      messageBtn = "Adicionado ao carrinho";
      print('Lista quando vazia');
    } else {
      print('Lista não vazia');

      icon = FontAwesomeIcons.times;
      messageBtn = "Item já adicionado";
      color = Colors.red;
      return;
    }
  }

  List<ProductModel> _filterProductToCart(ProductModel productModel) {
    var productFound = _homeController.productsToCar
        .where((product) => product.id == productModel.id)
        .toList();

    return productFound;
  }

  List<ProductModel> _filterProductToFavorites(ProductModel productModel) {
    var productFound = _homeController.favoriteProducts
        .where((product) => product.id == productModel.id)
        .toList();

    return productFound;
  }

  @action
  addFavorites(ProductModel productModel) {
    var productFound = _filterProductToFavorites(productModel);

    if (productFound.isEmpty) {
      _homeController.favoriteProducts.add(productModel);
      iconFavorite = FontAwesomeIcons.solidHeart;
      print('Lista quando vazia');
    } else {
      print('Lista não vazia');
      return;
    }
  }
}
