import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/repositories/categorie_repository.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/categorie_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:annaluxstore/app/modules/home/home_page.dart';

import '../../app_module.dart';
import 'homeContent/home_content_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICategorieRepository>((i) => CategorieRepository(i.get())),
        Bind((i) =>
            HomeContentController(i.get(), i.get<ICategorieRepository>())),
        Bind((i) => HomeController()),
        Bind((i) => Firestore.instance),
        Bind((i) => AuthController(AppModule.to.get<IAuthRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
