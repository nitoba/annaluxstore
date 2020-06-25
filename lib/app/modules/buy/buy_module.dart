import 'package:annaluxstore/app/modules/buy/pages/buy_page.dart';
import 'package:annaluxstore/app/modules/buy/repositories/buy_repository.dart';
import 'package:annaluxstore/app/modules/buy/repositories/interfaces/buy_repository_interface.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';

import '../../app_module.dart';
import 'buy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BuyController(i.get(), i.get(), i.get())),
        Bind((i) => HomeModule.to.get<HomeController>()),
        Bind((i) => AppModule.to.get<ISharedLocalRepository>()),
        Bind<IBuyRepository>((i) => BuyRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BuyPage()),
      ];

  static Inject get to => Inject<BuyModule>.of();
}
