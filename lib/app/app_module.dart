import 'package:annaluxstore/app/app_controller.dart';
import 'package:annaluxstore/app/first_page.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_repository.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/local_storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:annaluxstore/app/app_widget.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController(i.get(), i.get<ISharedLocalRepository>())),
        Bind<IAuthRepository>((i) =>
            AuthRepository(i.get<FirebaseAuth>(), i.get<GoogleSignIn>())),
        Bind((i) => FirebaseAuth.instance),
        Bind<ISharedLocalRepository>((i) => SharedRepository()),
        Bind((i) => GoogleSignIn()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FirstPage()),
        Router("/login", module: LoginModule()),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
