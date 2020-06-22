import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../buy_controller.dart';
import 'image_preview_widget.dart';

class CardInfoBuy extends StatelessWidget {
  const CardInfoBuy({
    Key key,
    @required this.product,
    @required this.controller,
    this.addQuantity,
    this.subQuantity,
    this.removeProduct,
  }) : super(key: key);

  final BuyController controller;
  final ProductModelStore product;
  final Function addQuantity;
  final Function subQuantity;
  final Function removeProduct;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  ImagePreview(productImage: product.images[0]),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      //color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(product.title),
                            subtitle: Text('Categoria: ${product.categorie}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("Quantidade: ${product.quantity}"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Container(
                          color: thirdColor,
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            onPressed: addQuantity,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          color: thirdColor,
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            onPressed: subQuantity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Preço:"),
                      product.totalPrice == 0
                          ? Text("R\$ ${product.price}")
                          : Text(
                              "R\$ ${product.totalPrice.toStringAsFixed(2)}"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //height: 30,
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Remover produto"),
                      Container(
                        color: thirdColor,
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.times,
                            color: Colors.white,
                          ),
                          onPressed: removeProduct,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
