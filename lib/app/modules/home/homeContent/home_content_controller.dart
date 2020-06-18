import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/categorie_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_content_controller.g.dart';

class HomeContentController = _HomeContentControllerBase
    with _$HomeContentController;

abstract class _HomeContentControllerBase with Store {
  AuthController _authController;
  ICategorieRepository _categorieRepository;
  _HomeContentControllerBase(this._authController, this._categorieRepository);

  List<CategoriesModel> categories = [];

  @action
  Future logout() async {
    await _authController.logout();
  }

  Future<List<CategoriesModel>> getCategories() async {
    categories = await _categorieRepository.getCategories();
    return categories;
  }
}
