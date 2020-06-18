import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'interfaces/categorie_repository_interface.dart';

class CategorieRepository implements ICategorieRepository {
  final Firestore _instance;
  CategorieRepository(this._instance);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> categorieList = [];

    var documents = await _instance.collection("products").getDocuments();

    documents.documents.map((doc) {
      categorieList.add(CategoriesModel.fromJson(doc));
    }).toList();
    print(categorieList);
    return categorieList;
  }
}
