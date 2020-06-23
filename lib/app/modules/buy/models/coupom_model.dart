import 'package:cloud_firestore/cloud_firestore.dart';

class CoupomModel {
  final String id;
  final String title;
  final int discount;
  CoupomModel({this.id, this.title, this.discount});

  factory CoupomModel.fromDocument(DocumentSnapshot coupom) {
    return CoupomModel(
      id: coupom.documentID,
      title: coupom.data['title'],
      discount: coupom.data['discount'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
