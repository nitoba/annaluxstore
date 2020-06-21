import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          Hero(
            tag: '${widget.product.id}',
            child: ImagesCarousel(
              controller: controller,
              images: widget.product.images,
            ),
          ),
          _buildIconArrowBack(),
          DetailProduct(
            id: widget.product.id,
            title: widget.product.title,
            categorie: widget.product.categorie,
            price: widget.product.price,
            description: widget.product.description,
            controller: controller,
            onPress: () {
              controller.addToShoppingCar(widget.product.id);
              Modular.to
                  .pushReplacementNamed('/buy', arguments: widget.product);
            },
          )
        ],
      ),
    );
  }

  Widget _buildIconArrowBack() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 8),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.5),
        ),
        child: Center(
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: thirdColor,
            ),
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ),
      ),
    );
  }
}
