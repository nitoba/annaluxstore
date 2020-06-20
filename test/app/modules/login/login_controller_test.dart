import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/login/login_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/modules/login/login_module.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

class SharedLocalStorageMock extends Mock implements ISharedLocalRepository {}

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<IAuthRepository>((i) => AuthRepositoryMock()),
    Bind<ISharedLocalRepository>((i) => SharedLocalStorageMock()),
  ]);
  initModule(LoginModule(), changeBinds: [
    Bind(
      (i) => AuthController(AppModule.to.get<IAuthRepository>(),
          AppModule.to.get<ISharedLocalRepository>()),
    ),
    //Bind((i) => LoginController(i.get())),
  ]);
  LoginController loginController;
  IAuthRepository authRepository;
  //
  setUp(() {
    loginController = LoginController(LoginModule.to.get<AuthController>());
    authRepository = AppModule.to.get<IAuthRepository>();
  });

  group('LoginController Test', () {
    test("First Test", () {
      expect(loginController, isInstanceOf<LoginController>());
      expect(authRepository, isInstanceOf<AuthRepositoryMock>());
    });

    // test("Login cancel should be return a user null", () async {
    //   expect(loginController.user, equals(null));
    //   expect(loginController.loading, equals(false));

    //   when(loginController.loginWithGoogle())
    //       .thenAnswer((_) => Future.value(null));

    //   var user = await loginController.loginWithGoogle();

    //   expect(loginController.loading, equals(false));

    //   expect(user, null);

    //   expect(loginController.user, equals(null));
    // });
    test("Login with google in loginController should be return a user",
        () async {
      var userModel = UserModel(
        id: "dasdasda",
        name: "Bruno Alves",
        email: "brukum2@gmail.com",
        photoUrl: "https://minhaphoto.com",
      );

      expect(loginController.user, equals(null));
      expect(loginController.loading, equals(false));

      when(authRepository.getGoogleLogin())
          .thenAnswer((_) => Future.value(loginController.user = userModel));

      await loginController.loginWithGoogle();

      expect(loginController.loading, equals(true));

      expect(loginController.user, equals(userModel));
    });
  });
}
