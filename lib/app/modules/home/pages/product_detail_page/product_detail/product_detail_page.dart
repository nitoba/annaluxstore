import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(widget.product.title),
          Text(widget.product.description),
          Text("${widget.product.price}"),
          Text(widget.product.categorie)
        ],
      ),
    );
  }
}
