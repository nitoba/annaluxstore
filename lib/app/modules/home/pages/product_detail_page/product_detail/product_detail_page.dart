import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/details_product/detail_product_widget.dart';
import 'components/images_carousel/images_carousel_widget.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final String title;
  final ProductModel product;
  const ProductDetailPage({Key key, this.title = "ProductDetail", this.product})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends ModularState<ProductDetailPage, ProductDetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            ImagesCarousel(
              controller: controller,
              images: widget.product.images,
            ),
            DetailProduct()
          ],
        ));
  }
}
