import 'package:annaluxstore/app/app_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:annaluxstore/app/app_widget.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';

import 'first_page.dart';
import 'modules/buy/buy_module.dart';
import 'modules/login/login_module.dart';
import 'modules/shared/auth/repositories/auth_interface.dart';

import 'modules/shared/auth/auth_controller.dart';
import 'modules/shared/auth/repositories/auth_repository.dart';
import 'modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'modules/shared/localstorage/local_storage_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController(
              i.get<IAuthRepository>(),
              i.get<ISharedLocalRepository>(),
            )),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<ISharedLocalRepository>((i) => SharedRepository()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FirstPage()),
        Router("/login", module: LoginModule()),
        Router("/home", module: HomeModule()),
        Router('/buy', module: BuyModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
