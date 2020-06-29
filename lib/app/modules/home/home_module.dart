import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/product_detail_page.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_repository.dart';

import 'pages/product_detail_page/product_detail/product_detail_controller.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/pages/categorie_page/categorie_controller.dart';
import 'package:annaluxstore/app/modules/home/pages/categorie_page/categorie_page.dart';
import 'package:annaluxstore/app/modules/home/pages/home_content/home_content_controller.dart';
import 'package:annaluxstore/app/modules/home/repositories/home_repository.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/auth_controller.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:annaluxstore/app/modules/home/home_page.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ProductDetailController(
            i.get(),
            i.get<ISharedLocalRepository>(),
          ),
        ),
        Bind((i) => CategorieController(i.get<IHomeRepository>())),
        Bind<IHomeRepository>((i) => HomeRepository()),
        Bind(
          (i) => HomeContentController(
            /*i.get(),*/ i.get<IHomeRepository>(),
          ),
        ),
        Bind(
          (i) => HomeController(
            i.get<ISharedLocalRepository>(),
            i.get<IHomeRepository>(),
            AppModule.to.get<IAuthRepository>(),
          ),
        ),
        Bind<ISharedLocalRepository>(
          (i) => AppModule.to.get<ISharedLocalRepository>(),
        ),
        Bind((i) => AuthController(
              AppModule.to.get<IAuthRepository>(),
              i.get<ISharedLocalRepository>(),
            )),
        Bind<IAuthRepository>((i) => AuthRepository())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router(
          '/categorie/:id/:title',
          child: (_, args) => CategoriePage(
            id: args.params['id'],
            title: args.params['title'],
          ),
        ),
        Router('/product',
            child: (_, args) => ProductDetailPage(product: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
