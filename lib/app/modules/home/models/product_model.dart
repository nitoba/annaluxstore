import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
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

  Map<String, dynamic> toJson() => {};
}
