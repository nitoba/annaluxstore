import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

abstract class IAdressRepository {
  Future<AdressModel> getUserAdress(String cep);
  Future<void> saveUserAdressInDatabase(
      AdressModel adressModel, UserModel userModel);
  Future<AdressModel> getUserAdressInDatabase(UserModel userModel);
}
