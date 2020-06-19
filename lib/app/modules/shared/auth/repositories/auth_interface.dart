import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserModel> getUser();
  Future<UserModel> getGoogleLogin();
  Future<void> logout();
}
