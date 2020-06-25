import 'package:annaluxstore/app/modules/favorites/components/favorite_list_widget.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key key, this.title = "Favorites"}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends ModularState<FavoritesPage, FavoritesController> {
  //use 'controller' variable to access controller

  @override
  initState() {
    controller.getFavoriteProducts();
    super.initState();
  }

  @override
  void dispose() {
    //print("pagina fechada");
    Modular.get<HomeController>().saveFavoriteProducts();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.favoriteProducts.isNotEmpty) {
              return FavoriteList(
                controller: controller,
              );
            } else if (controller.favoriteProducts.isNotEmpty &&
                controller.favoriteProducts != null) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
                ),
              );
            } else {
              return Center(child: Text("Sem produtos na lista de favoritos"));
            }
          },
        ),
      ),
    );
  }
}
