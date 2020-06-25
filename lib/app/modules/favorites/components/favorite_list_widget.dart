import 'package:annaluxstore/app/modules/favorites/components/item_favorite_widget.dart';
import 'package:annaluxstore/app/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';

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
        itemCount: controller.favoriteProducts.length,
        itemBuilder: (context, index) {
          return FavoriteProductCard(
            controller: controller,
            product: controller.favoriteProducts[index],
          );
        },
      ),
    );
  }
}
