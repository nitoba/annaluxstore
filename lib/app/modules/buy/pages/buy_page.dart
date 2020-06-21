import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/card_info_buy_widget.dart';
import 'components/image_preview_widget.dart';

class BuyPage extends StatefulWidget {
  final String title;
  final ProductModel product;
  const BuyPage({Key key, this.title = "Buy", this.product}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends ModularState<BuyPage, BuyController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          CardInfoBuy(
            controller: controller,
            product: widget.product,
            addQuantity: () {
              controller.calcPriceByQuantityPlus(widget.product.price);
            },
            subQuantity: () {
              controller.calcPriceByQuantitySub(widget.product.price);
            },
          ),
        ],
      ),
    );
  }
}
