import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final List images;
  final double price;
  final String categorie;
  final int quantity;
  final double totalprice;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.images,
    this.price,
    this.categorie,
    this.quantity,
    this.totalprice,
  });

  factory ProductModel.fromDocument(DocumentSnapshot doc,
      [String categorieID]) {
    return ProductModel(
      id: doc.documentID ?? "",
      title: doc.data['title'] ?? "",
      description: doc.data['description'] ?? "",
      images: doc.data['images'] ?? "",
      price: doc.data['price'] ?? "",
      categorie: categorieID ?? "",
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json,
      [String categorieID]) {
    return ProductModel(
      id: json['documentID'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      images: json['images'] ?? "",
      price: json['price'] ?? "",
      categorie: categorieID ?? "",
    );
  }

  factory ProductModel.fromModelStore(ProductModelStore modelStore) {
    return ProductModel(
      id: modelStore.id,
      title: modelStore.title,
      description: modelStore.description,
      images: modelStore.images,
      price: modelStore.price,
      categorie: modelStore.categorie,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentID': this.id,
      'title': this.title,
      'description': this.description,
      'images': this.images,
      'price': this.price,
      'categories': this.categorie,
    };
  }

  Map<String, dynamic> toOrder() {
    return {
      'title': this.title,
      'price': this.price,
      'quantity': this.quantity,
      'totalprice': this.totalprice,
    };
  }
}
