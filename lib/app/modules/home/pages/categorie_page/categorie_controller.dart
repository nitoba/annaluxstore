import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'categorie_controller.g.dart';

class CategorieController = _CategorieControllerBase with _$CategorieController;

abstract class _CategorieControllerBase with Store {
  final IHomeRepository _homeRepository;
  @observable
  List<ProductModel> products = [];

  _CategorieControllerBase(this._homeRepository);

  @action
  Future<void> getProductByCategorie(String categorieID) async {
    products = await _homeRepository.getProductByCategorie(categorieID);
  }
}
