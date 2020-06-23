import 'dart:convert';

import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository _homeRepository;
  @observable
  int currentIndex = 0;

  List<ProductModel> productsToCar = [];

  List<CoupomModel> coupons = [];

  _HomeControllerBase(this._homeRepository);

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

  Future<List<CoupomModel>> getCupons() async {
    coupons = await _homeRepository.getCoupons();
    return coupons;
  }
}
