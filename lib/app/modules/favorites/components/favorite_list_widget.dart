import 'package:annaluxstore/app/modules/favorites/components/item_favorite_widget.dart';
import 'package:annaluxstore/app/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final FavoritesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: controller.favoriteProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: FavoriteProductCard(
              index: index,
              controller: controller,
              product: controller.favoriteProducts[index],
            ),
            onTap: () {
              Modular.to.pushNamed("/home/product",
                  arguments: controller.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
