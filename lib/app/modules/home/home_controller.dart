import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthController _authController;
  _HomeControllerBase(this._authController);

  @action
  Future logout() async {
    await _authController.logout();
  }
}
