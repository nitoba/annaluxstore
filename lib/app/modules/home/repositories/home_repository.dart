import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository implements IHomeRepository {
  final Firestore _instance = Firestore.instance;

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> categorieList = [];

    var documents = await _instance.collection("products").getDocuments();

    categorieList = documents.documents
        .map((categorie) => CategoriesModel.fromJson(categorie))
        .toList();
    //print(categorieList.map((e) => e.id));
    return categorieList;
  }

  Future<QuerySnapshot> _getProductsInsideCollection(String collection) async {
    var products = await _instance
        .collection("products")
        .document(collection)
        .collection("items")
        .getDocuments();
    return products;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];

    String categorieName;

    categorieName = await _getCategoriesNames('mask');

    var masks = await _getProductsInsideCollection('mask');

    masks.documents.map((product) {
      products.add(ProductModel.fromDocument(product, categorieName));
    }).toList();

    categorieName = await _getCategoriesNames('dresses');

    var dresses = await _getProductsInsideCollection('dresses');

    dresses.documents.map((product) {
      products.add(ProductModel.fromDocument(product, categorieName));
    }).toList();

    categorieName = await _getCategoriesNames('baby_clothes');

    var babyClothes = await _getProductsInsideCollection('baby_clothes');

    babyClothes.documents.map((product) {
      products.add(ProductModel.fromDocument(product, categorieName));
    }).toList();

    //print(products[0].id);

    return products;
  }

  @override
  Future<List<ProductModel>> getProductByCategorie(String categorieID) async {
    List<ProductModel> listProducts = [];

    String categorieName = await _getCategoriesNames(categorieID);

    var products = await _getProductsInsideCollection(categorieID);

    listProducts = products.documents
        .map((product) => ProductModel.fromDocument(product, categorieName))
        .toList();
    // print(listProducts.length);
    // print(listProducts[0].categorie);

    return listProducts;
  }

  Future<String> _getCategoriesNames(String categorieID) async {
    Map<String, dynamic> categorieMap = {};

    var documents = await _instance.collection("products").getDocuments();

    documents.documents.map((categorie) {
      categorieMap[categorie.documentID] = categorie.data['title'];
    }).toList();

    return categorieMap[categorieID];
  }

  @override
  Future<List<CoupomModel>> getCoupons() async {
    List<CoupomModel> coupons = [];
    var documents = await _instance.collection("coupons").getDocuments();

    coupons = documents.documents
        .map((coupom) => CoupomModel.fromDocument(coupom))
        .toList();

    return coupons;
  }
}
