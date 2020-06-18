import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String title;
  final String image;

  CategoriesModel({this.title, this.image});

  factory CategoriesModel.fromJson(DocumentSnapshot doc) {
    return CategoriesModel(
      title: doc.data['title'],
      image: doc.data['image'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
