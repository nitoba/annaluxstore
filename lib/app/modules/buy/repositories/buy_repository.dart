import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/repositories/interfaces/buy_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyRepository implements IBuyRepository {
  final Firestore _instance = Firestore.instance;

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
