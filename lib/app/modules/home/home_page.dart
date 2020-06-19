import 'package:annaluxstore/app/modules/buy/buy_module.dart';
import 'package:annaluxstore/app/modules/home/pages/homeContent/homeContent_page.dart';
import 'package:annaluxstore/app/modules/profile/profile_module.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  List widgetOptions = [
    HomeContentPage(),
    BuyModule(),
    ProfileModule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          return widgetOptions.elementAt(controller.currentIndex);
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.updateCurrentIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: controller.currentIndex == 0 ? thirdColor : Colors.black,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.shoppingCart,
              color: controller.currentIndex == 1 ? thirdColor : Colors.black,
            ),
            title: Text("Carrinho"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userAlt,
              color: controller.currentIndex == 2 ? thirdColor : Colors.black,
            ),
            title: Text("Perfil"),
          ),
        ],
      );
    });
  }
}
