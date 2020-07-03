import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/favorites/favorites_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({
    Key key,
    @required this.controller,
    this.product,
    this.index,
  }) : super(key: key);

  final FavoritesController controller;
  final ProductModelStore product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.images[0],
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(product.title),
                subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
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
                  onTap: () {
                    controller.removeFavoriteProducts(product);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
