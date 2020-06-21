import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'product_detail_controller.g.dart';

class ProductDetailController = _ProductDetailControllerBase
    with _$ProductDetailController;

abstract class _ProductDetailControllerBase with Store {
  final HomeController _homeController;

  @observable
  String messageBtn = "Adicionar ao carrinho";

  @observable
  IconData icon = FontAwesomeIcons.shoppingCart;

  @observable
  Color color = thirdColor;
  @observable
  bool isAdd = false;

  _ProductDetailControllerBase(this._homeController);
  @action
  addToShoppingCar(String idProduct) {
    var idFound = _homeController.productsIdsToCar.indexOf(idProduct);

    if (idFound == -1) {
      _homeController.productsIdsToCar.add(idProduct);
      print(_homeController.productsIdsToCar.length);
      icon = FontAwesomeIcons.check;
      color = Colors.green;
      isAdd = true;
      messageBtn = "Adicionado ao carrinho";
    } else {
      icon = FontAwesomeIcons.times;
      messageBtn = "Item já adicionado";
      color = Colors.red;
      return;
    }
  }

  List<CachedNetworkImage> getProductImages(List images) {
    return images
        .map(
          (imagem) => CachedNetworkImage(
            placeholder: (_, url) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
              ),
            ),
            imageUrl: imagem,
            fit: BoxFit.cover,
          ),
        )
        .toList();
  }
}
