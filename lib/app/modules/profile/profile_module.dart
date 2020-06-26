import 'package:annaluxstore/app/modules/profile/repositories/adress_repository.dart';
import 'package:annaluxstore/app/modules/profile/repositories/adress_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_repository.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../app_module.dart';
import 'profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'profile_page.dart';

class ProfileModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController(i.get<IAuthRepository>(),
            i.get<IAdressRepository>(), i.get<ISharedLocalRepository>())),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<IAdressRepository>((i) => AdressRepository(i.get<Dio>())),
        Bind<Dio>((i) => AppModule.to.get<Dio>()),
        Bind<ISharedLocalRepository>(
            (i) => AppModule.to.get<ISharedLocalRepository>())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();

  @override
  Widget get view => ProfilePage();
}
