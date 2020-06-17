import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  IAuthRepository _authRepository;

  @observable
  UserModel user;

  _AuthControllerBase(this._authRepository) {
    //_authRepository.getUser().then((setUser));
  }

  @action
  Future<UserModel> loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    return user;
  }

  @action
  setUser(UserModel userModel) => user = userModel;

  @action
  Future<UserModel> logout() async {
    await _authRepository.logout();
    if (user != null) {
      user.id = "";
      user.name = "";
      user.email = "";
      user.photoUrl = "";
    }

    user = UserModel(
      id: "",
      name: "",
      email: "",
      photoUrl: "",
    );

    return user;
  }
}
