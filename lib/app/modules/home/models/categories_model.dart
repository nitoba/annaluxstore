import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String id;
  final String title;
  final String image;

  CategoriesModel({this.id, this.title, this.image});

  factory CategoriesModel.fromJson(DocumentSnapshot doc) {
    return CategoriesModel(
      id: doc.documentID,
      title: doc.data['title'],
      image: doc.data['image'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
