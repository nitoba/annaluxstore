import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ICategorieRepository implements Disposable {
  Future<List<CategoriesModel>> getCategories();
}
