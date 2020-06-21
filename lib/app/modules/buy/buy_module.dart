import 'package:annaluxstore/app/modules/buy/pages/buy_page.dart';

import 'buy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BuyController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => BuyPage(
                  product: args.data,
                )),
      ];

  static Inject get to => Inject<BuyModule>.of();
}
