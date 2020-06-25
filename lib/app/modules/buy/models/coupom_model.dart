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

  factory CoupomModel.fromJson(Map<String, dynamic> coupom) {
    return CoupomModel(
      id: coupom['documentID'],
      title: coupom['title'],
      discount: coupom['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> coupom = Map<String, dynamic>();
    coupom['documentID'] = this.id;
    coupom['title'] = this.title;
    coupom['discount'] = this.discount;
    return coupom;
  }
}
