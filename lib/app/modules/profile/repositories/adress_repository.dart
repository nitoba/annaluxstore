import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/profile/repositories/adress_repository_interface.dart';
import 'package:dio/dio.dart';

class AdressRepository implements IAdressRepository {
  final Dio _dio;

  AdressRepository(this._dio);
  @override
  Future<AdressModel> getUserAdress(String cep) async {
    AdressModel adress;

    var response = await _dio.get("https://viacep.com.br/ws/$cep/json/");

    adress = AdressModel.fromJson(response.data);

    return adress;
  }
}
