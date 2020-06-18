import 'package:flutter/src/widgets/framework.dart';

import 'buy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'buy_page.dart';

class BuyModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BuyController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BuyPage()),
      ];

  static Inject get to => Inject<BuyModule>.of();

  @override
  Widget get view => BuyPage();
}
