import 'package:annaluxstore/app/modules/favorites/favorites_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key key,
    @required this.controller,
    @required this.removeFavorite,
  }) : super(key: key);

  final FavoritesController controller;
  final Function removeFavorite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.favoriteProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.favoriteProducts[index].title),
          subtitle: Text(
              "R\$ ${controller.favoriteProducts[index].price.toStringAsFixed(2)}"),
          leading: CachedNetworkImage(
            imageUrl: controller.favoriteProducts[index].images[0],
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
          trailing: GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: thirdColor,
                child: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            onTap: removeFavorite,
          ),
        );
      },
    );
  }
}
