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

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    return ProductModel(
      id: doc.documentID,
      title: doc.data['title'],
      description: doc.data['description'],
      images: doc.data['images'],
      price: doc.data['price'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
