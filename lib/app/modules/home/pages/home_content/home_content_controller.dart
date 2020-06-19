import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';

import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_content_controller.g.dart';

class HomeContentController = _HomeContentControllerBase
    with _$HomeContentController;

abstract class _HomeContentControllerBase with Store {
  AuthController _authController;
  IHomeRepository _homeRepository;
  _HomeContentControllerBase(this._authController, this._homeRepository);

  // List<CategoriesModel> categories = [];
  List<ProductModel> products = [];

  @action
  Future logout() async {
    await _authController.logout();
  }

  Future<List<CategoriesModel>> getCategories() async {
    return await _homeRepository.getCategories();
  }

  Future<List<ProductModel>> getAllProducts() async {
    return await _homeRepository.getAllProducts();
  }

  Future<List<ProductModel>> getProductOfCategorie(String categorieID) async {
    return await _homeRepository.getProductByCategorie(categorieID);
  }
}
