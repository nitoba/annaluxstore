import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get())),
        Bind((i) => AuthController(AppModule.to.get<IAuthRepository>(),
            AppModule.to.get<ISharedLocalRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
