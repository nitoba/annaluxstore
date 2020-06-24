import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IHomeRepository implements Disposable {
  Future<List<CategoriesModel>> getCategories();
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductByCategorie(String categorieID);
}
