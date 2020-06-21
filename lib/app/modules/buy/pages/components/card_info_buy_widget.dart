import 'package:annaluxstore/app/modules/home/models/product_model.dart';
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
  }) : super(key: key);

  final BuyController controller;
  final ProductModel product;
  final Function addQuantity;
  final Function subQuantity;

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
                            subtitle: Text(product.categorie),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text("Quantidade: ${controller.quantity}"),
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
                      Text(
                        controller.totalPrice == 0
                            ? "R\$ ${product.price}"
                            : "R\$ ${controller.totalPrice.toStringAsFixed(2)}",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
