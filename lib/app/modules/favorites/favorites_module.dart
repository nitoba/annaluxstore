import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'favorites_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'favorites_page.dart';

class FavoritesModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FavoritesController(i.get())),
        Bind((i) => HomeModule.to.get<HomeController>()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FavoritesPage()),
      ];

  static Inject get to => Inject<FavoritesModule>.of();

  @override
  Widget get view => FavoritesPage();
}
