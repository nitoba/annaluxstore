import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';

abstract class IAdressRepository {
  Future<AdressModel> getUserAdress(String cep);
}
