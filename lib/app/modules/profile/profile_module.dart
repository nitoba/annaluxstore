import 'package:flutter/material.dart';

import 'profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'profile_page.dart';

class ProfileModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();

  @override
  Widget get view => ProfilePage();
}
