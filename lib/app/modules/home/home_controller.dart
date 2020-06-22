import 'dart:convert';

import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentIndex = 0;

  List<ProductModel> productsToCar = [];

  @action
  void updateCurrentIndex(int index) {
    this.currentIndex = index;
  }

  List<ProductModel> addProductToCar(ProductModel productModel) {
    productsToCar.add(productModel);
    return productsToCar;
  }

  removeProductToCar(String id) {
    productsToCar.removeWhere((element) => element.id == id);
  }
}
