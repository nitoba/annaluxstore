import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'product_detail_controller.g.dart';

class ProductDetailController = _ProductDetailControllerBase
    with _$ProductDetailController;

abstract class _ProductDetailControllerBase with Store {
  List<CachedNetworkImage> getProductImages(List images) {
    return images
        .map(
          (imagem) => CachedNetworkImage(
            placeholder: (_, url) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
              ),
            ),
            imageUrl: imagem,
            fit: BoxFit.cover,
          ),
        )
        .toList();
  }
}
