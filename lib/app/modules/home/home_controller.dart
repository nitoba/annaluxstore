import 'dart:convert';

import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ISharedLocalRepository _sharedLocalRepository;
  @observable
  int currentIndex = 0;

  List<ProductModel> productsToCar = [];

  List<ProductModel> favoriteProducts = [];

  _HomeControllerBase(this._sharedLocalRepository);

  @action
  void updateCurrentIndex(int index) {
    this.currentIndex = index;
  }

  List<ProductModel> getProductsToCar() {
    return productsToCar;
  }

  List<ProductModel> getFavoriteProducts() {
    return favoriteProducts;
  }

  List<ProductModel> addProductToCar(ProductModel productModel) {
    productsToCar.add(productModel);

    return productsToCar;
  }

  removeProductToCar(String id) {
    productsToCar.removeWhere((product) => product.id == id);
  }

  removeFavoriteProducts(String id) {
    favoriteProducts.removeWhere((favoriteProduct) => favoriteProduct.id == id);
  }
}
