import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
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
  final ISharedLocalRepository _sharedLocalRepository;

  @observable
  String messageBtn = "Adicionar ao carrinho";

  @observable
  IconData icon = FontAwesomeIcons.shoppingCart;

  @observable
  Color color = thirdColor;
  @observable
  bool isAdd = false;

  _ProductDetailControllerBase(
      this._homeController, this._sharedLocalRepository);

  @action
  addToShoppingCar(ProductModel productModel) {
    var productFound = _filterProduct(productModel);

    if (productFound.isEmpty) {
      //_homeController.productsToCar.add(productModel);
      //var products = _homeController.addProductToCar(productModel);
      _homeController.addProductToCar(productModel);
      //_sharedLocalRepository.insert('car', products);
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

  List<ProductModel> _filterProduct(ProductModel productModel) {
    var productFound = _homeController.productsToCar
        .where((product) => product.id == productModel.id)
        .toList();

    return productFound;
  }
}
