import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/models/rate_model.dart';
import 'package:annaluxstore/app/modules/buy/repositories/interfaces/buy_repository_interface.dart';
import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
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

  @override
  Future<RateModel> getDelireryRate(UserModel userModel) async {
    RateModel rate;

    var user = await _instance
        .collection("users")
        .where("id", isEqualTo: userModel.id)
        .getDocuments();

    var adressUser = user.documents[0].data['adress'];

    if (adressUser != null) {
      var bairros = await _instance
          .collection("delivery_changes")
          .document("zn_norte")
          .collection("bairros")
          .where('title', isEqualTo: adressUser['bairro'])
          .getDocuments();

      if (bairros.documents.isNotEmpty) {
        rate = RateModel.fromDocument(bairros.documents[0]);
      }
    }

    return rate;
  }
}
