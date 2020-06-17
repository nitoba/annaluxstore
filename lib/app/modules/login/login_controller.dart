import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController _authController;

  _LoginControllerBase(this._authController);

  @observable
  bool loading = false;

  @observable
  UserModel user;

  @action
  Future<UserModel> loginWithGoogle() async {
    loading = true;

    user = await _authController.loginWithGoogle();

    if (user != null) {
      return user;
    }

    loading = false;

    return null;
  }
}
