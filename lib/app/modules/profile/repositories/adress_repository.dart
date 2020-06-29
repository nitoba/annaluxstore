import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/profile/repositories/adress_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class AdressRepository implements IAdressRepository {
  final Dio _dio;
  final Firestore _instance = Firestore.instance;

  AdressRepository(this._dio);
  @override
  Future<AdressModel> getUserAdress(String cep) async {
    AdressModel adress;

    var response = await _dio.get("https://viacep.com.br/ws/$cep/json/");

    adress = AdressModel.fromJson(response.data);

    return adress;
  }

  @override
  Future<void> saveUserAdressInDatabase(
      AdressModel adressModel, UserModel userModel) async {
    var userDatabase = await _instance
        .collection("users")
        .where("id", isEqualTo: userModel.id)
        .getDocuments();
    var userId = userDatabase.documents[0].documentID;

    var user = userDatabase.documents[0].data;

    if (user['adress']['cep'] == adressModel.cep) return;

    _instance.collection("users").document(userId).setData({
      "id": userModel.id,
      "name": userModel.name,
      "email": userModel.email,
      "adress": adressModel.toJson(),
    });
  }

  @override
  Future<AdressModel> getUserAdressInDatabase(UserModel userModel) async {
    var userDatabase = await _instance
        .collection("users")
        .where("id", isEqualTo: userModel.id)
        .getDocuments();
    var user = userDatabase.documents[0].data;

    return AdressModel.fromJson(user['adress']);
  }
}
