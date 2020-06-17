import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> getUser();
  Future<UserModel> getGoogleLogin();
  Future<void> logout();
}
