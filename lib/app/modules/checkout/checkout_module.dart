import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/checkout/repositories/order_repository.dart';
import 'package:annaluxstore/app/modules/checkout/repositories/order_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_repository.dart';

import 'checkout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'checkout_page.dart';

class CheckoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CheckoutController(
              i.get<IOrderRepository>(),
              i.get<IAuthRepository>(),
            )),
        Bind<IOrderRepository>((i) => OrderRepository()),
        Bind<IAuthRepository>((i) => AuthRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => CheckoutPage(productsToCar: args.data)),
      ];

  static Inject get to => Inject<CheckoutModule>.of();
}
