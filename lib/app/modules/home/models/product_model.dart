import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final List images;
  final double price;
  final String categorie;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.images,
    this.price,
    this.categorie,
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

  Map<String, dynamic> toJson() => {};
}
