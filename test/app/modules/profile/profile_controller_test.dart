import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/profile/profile_controller.dart';
import 'package:annaluxstore/app/modules/profile/repositories/adress_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/modules/profile/profile_module.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

class SharedRepositoryMock extends Mock implements ISharedLocalRepository {}

class AdressRepositoryMock extends Mock implements IAdressRepository {}

void main() {
  initModule(ProfileModule(), changeBinds: [
    Bind<IAuthRepository>((i) => AuthRepositoryMock()),
    Bind<IAdressRepository>((i) => AdressRepositoryMock()),
    Bind<ISharedLocalRepository>((i) => SharedRepositoryMock())
  ]);
  ProfileController profileController;
  IAuthRepository authRepository;
  IAdressRepository adressRepository;
  ISharedLocalRepository sharedLocalRepository;
  //
  setUp(() {
    profileController = ProfileModule.to.get<ProfileController>();
    authRepository = ProfileModule.to.get<IAuthRepository>();
    adressRepository = ProfileModule.to.get<IAdressRepository>();
    sharedLocalRepository = ProfileModule.to.get<ISharedLocalRepository>();
  });

  group('ProfileController Test', () {
    test("First Test", () {
      expect(profileController, isInstanceOf<ProfileController>());
      expect(authRepository, isInstanceOf<AuthRepositoryMock>());
      expect(adressRepository, isInstanceOf<AdressRepositoryMock>());
      expect(sharedLocalRepository, isInstanceOf<SharedRepositoryMock>());
    });

    test(
        "When called getUserInfos should be return the informations of user login",
        () async {
      when(authRepository.getUser()).thenAnswer((_) => Future.value(UserModel(
            id: "123456",
            name: "Bruno Alves",
            email: "brukum2@gmail.com",
            photoUrl: "http://minhafoto.com.br",
          )));

      await profileController.getUserInfos();

      expect(profileController.user, isNot(null));
      expect(profileController.user.name, "Bruno Alves");
      expect(profileController.user.email, "brukum2@gmail.com");
      expect(profileController.user.id, "123456");
      expect(profileController.user.photoUrl, "http://minhafoto.com.br");
    });

    test("When called the getUserAdress should be return user adress by cep",
        () async {
      when(adressRepository.getUserAdress("64010110"))
          .thenAnswer((_) => Future.value(AdressModel(
                bairro: "Mocambinho",
                cep: "64010110",
                logradouro: "Quadra Mocambinho - Setor A",
                complemento: "de 31/32 a 32/33",
              )));

      await profileController.getUserAdress("64010110");

      expect(profileController.userAdress, isNot(null));
      expect(profileController.userAdress.bairro, "Mocambinho");
      expect(profileController.userAdress.cep, "64010110");
      expect(profileController.userAdress.logradouro,
          "Quadra Mocambinho - Setor A");
      expect(profileController.userAdress.complemento, "de 31/32 a 32/33");
    });

    test("When called the loadUserAdress should be return user adress saved",
        () async {
      profileController.userAdress = null;
      when(sharedLocalRepository.get("adress")).thenAnswer(
        (_) => Future.value(
          """{
            "cep": "64010110",
            "logradouro": "Quadra Mocambinho - Setor A",
            "complemento": "de 31/32 a 32/33",
            "bairro": "Mocambinho"
            }""",
        ),
      );

      await profileController.loadUserAdress();

      expect(profileController.userAdress, isNot(null));
      expect(profileController.userAdress.bairro, "Mocambinho");
      expect(profileController.userAdress.cep, "64010110");
      expect(profileController.userAdress.logradouro,
          "Quadra Mocambinho - Setor A");
      expect(profileController.userAdress.complemento, "de 31/32 a 32/33");
    });

    test("When called editUserAdress should be setted userAdress as null", () {
      profileController.editUserAdress();

      expect(profileController.userAdress, null);
    });
  });
}
