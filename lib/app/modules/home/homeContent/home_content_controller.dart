import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_content_controller.g.dart';

class HomeContentController = _HomeContentControllerBase
    with _$HomeContentController;

abstract class _HomeContentControllerBase with Store {
  AuthController _authController;
  _HomeContentControllerBase(this._authController);

  @action
  Future logout() async {
    await _authController.logout();
  }
}
