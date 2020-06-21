import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/product_detail_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImagesCarousel extends StatelessWidget {
  const ImagesCarousel({
    Key key,
    @required this.controller,
    @required this.images,
  }) : super(key: key);

  final ProductDetailController controller;

  final List images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        dotBgColor: Colors.transparent,
        dotSize: 6,
        dotColor: thirdColor,
        dotVerticalPadding: 30,
        dotIncreasedColor: Colors.pinkAccent,
        images: controller.getProductImages(images),
      ),
    );
  }
}
