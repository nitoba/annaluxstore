import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/app_module.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

class SharedLocalStorageMock extends Mock implements ISharedLocalRepository {}

main() {
  initModule(
    AppModule(),
    changeBinds: [
      Bind<IAuthRepository>((i) => AuthRepositoryMock()),
      Bind<ISharedLocalRepository>((i) => SharedLocalStorageMock()),
    ],
  );

  AuthController authController;
  IAuthRepository authRepository;
  ISharedLocalRepository sharedLocalRepository;
  //
  setUp(() {
    authController = AppModule.to.get<AuthController>();
    authRepository = AppModule.to.get<IAuthRepository>();
    sharedLocalRepository = AppModule.to.get<ISharedLocalRepository>();
  });

  group('AppController Test', () {
    test("First Test", () {
      expect(authController, isInstanceOf<AuthController>());
      expect(sharedLocalRepository, isInstanceOf<SharedLocalStorageMock>());
    });

    test("When call loginWithGoogle should be return a user", () async {
      when(authRepository.getGoogleLogin()).thenAnswer((_) => Future.value(
            authController.user = UserModel(
              id: "dasdasda",
              name: "Bruno Alves",
              email: "brukum2@gmail.com",
              photoUrl: "https://minhaphoto.com",
            ),
          ));

      when(sharedLocalRepository.insert('login', true))
          .thenAnswer((_) => Future.value(true));

      await authController.loginWithGoogle();

      expect(authController.user, isNot(null));
      expect(authController.user.id, "dasdasda");
      expect(authController.user.name, "Bruno Alves");
      expect(authController.user.email, "brukum2@gmail.com");
      expect(authController.user.photoUrl, "https://minhaphoto.com");
    });

    test("When call logout should be return a user empty", () async {
      when(authController.logout()).thenAnswer((_) => Future.value(
            UserModel(
              id: "",
              name: "",
              email: "",
              photoUrl: "",
            ),
          ));

      var user = await authController.logout();

      expect(user, isNot(null));
      expect(user.id, "");
      expect(user.name, "");
      expect(user.email, "");
      expect(user.photoUrl, "");
    });
  });
}
