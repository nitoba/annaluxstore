import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository implements IHomeRepository {
  final Firestore _instance;
  HomeRepository(this._instance);

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
    //print(categorieList.map((e) => e.id));
    return categorieList;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];

    var masks = await _instance
        .collection("products")
        .document('mask')
        .collection("items")
        .getDocuments();

    var dresses = await _instance
        .collection("products")
        .document('dresses')
        .collection("items")
        .getDocuments();

    var babyClothes = await _instance
        .collection("products")
        .document('baby_clothes')
        .collection("items")
        .getDocuments();

    masks.documents.map((product) {
      products.add(ProductModel.fromDocument(product));
    }).toList();

    dresses.documents.map((product) {
      products.add(ProductModel.fromDocument(product));
    }).toList();

    babyClothes.documents.map((product) {
      products.add(ProductModel.fromDocument(product));
    }).toList();

    //print(products.length);

    return products;
  }
}
