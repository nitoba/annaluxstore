import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository;
  final ISharedLocalRepository _sharedLocalRepository;

  @observable
  UserModel user;

  _AuthControllerBase(this._authRepository, this._sharedLocalRepository) {
    getUser();
  }

  @action
  Future<UserModel> loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    if (user != null) {
      await _sharedLocalRepository.insert("login", true);
      return user;
    }
    return null;
  }

  @action
  getUser() async {
    user = await _authRepository.getUser();
    if (user != null) {
      //print(isLogin);
      //await _sharedLocalRepository.getIsLogin("login");
      return user;
    } else if (user == null) {
      //print(isLogin);

      return null;
    }
  }

  @action
  Future<UserModel> logout() async {
    await _authRepository.logout();
    if (user != null) {
      user.id = "";
      user.name = "";
      user.email = "";
      user.photoUrl = "";
      await _sharedLocalRepository.insert("login", false);
    }

    user = UserModel(
      id: "",
      name: "",
      email: "",
      photoUrl: "",
    );

    await _sharedLocalRepository.insert("login", false);

    return user;
  }
}
