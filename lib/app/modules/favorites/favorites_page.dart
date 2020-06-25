import 'package:annaluxstore/app/modules/favorites/components/favorite_list_widget.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  void initState() {
    controller.getFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
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
    );
  }
}
