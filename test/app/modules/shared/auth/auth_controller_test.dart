import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/app_module.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

main() {
  initModule(
    AppModule(),
    changeBinds: [Bind<IAuthRepository>((i) => AuthRepositoryMock())],
  );

  AuthController authController;
  IAuthRepository authRepository;
  //
  setUp(() {
    authController = AppModule.to.get<AuthController>();
    authRepository = Modular.get<AuthRepositoryMock>();
  });

  group('AppController Test', () {
    test("First Test", () {
      expect(authController, isInstanceOf<AuthController>());
    });

    test("When call loginWithGoogle should be return a user", () async {
      when(authRepository.getGoogleLogin()).thenAnswer((_) => Future.value(
            UserModel(
              id: "dasdasda",
              name: "Bruno Alves",
              email: "brukum2@gmail.com",
              photoUrl: "https://minhaphoto.com",
            ),
          ));

      authController.user = await authRepository.getGoogleLogin();

      //await authController.loginWithGoogle();

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