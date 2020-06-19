import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/pages/homeContent/home_content_controller.dart';
import 'package:annaluxstore/app/modules/home/repositories/home_repository.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:annaluxstore/app/modules/home/home_page.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHomeRepository>((i) => HomeRepository(i.get())),
        Bind((i) => HomeContentController(i.get(), i.get<IHomeRepository>())),
        Bind((i) => HomeController()),
        Bind((i) => Firestore.instance),
        Bind((i) => AuthController(AppModule.to.get<IAuthRepository>(),
            AppModule.to.get<ISharedLocalRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
