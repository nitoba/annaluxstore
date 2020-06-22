import 'package:annaluxstore/app/modules/buy/pages/buy_page.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';

import 'buy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BuyController(i.get())),
        Bind((i) => HomeModule.to.get<HomeController>()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BuyPage()),
      ];

  static Inject get to => Inject<BuyModule>.of();
}
