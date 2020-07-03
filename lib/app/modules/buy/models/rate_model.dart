import 'package:cloud_firestore/cloud_firestore.dart';

class RateModel {
  final String id;
  final String title;
  final int rate;
  RateModel({this.id, this.title, this.rate});

  factory RateModel.fromDocument(DocumentSnapshot doc) {
    return RateModel(
      id: doc.documentID,
      title: doc.data['title'],
      rate: doc.data['rate'],
    );
  }
}
