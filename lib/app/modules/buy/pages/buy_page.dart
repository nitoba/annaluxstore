import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/card_info_buy_widget.dart';

class BuyPage extends StatefulWidget {
  final String title;

  const BuyPage({
    Key key,
    this.title = "Buy",
  }) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends ModularState<BuyPage, BuyController> {
  @override
  void initState() {
    controller.getProductsInCar();
    super.initState();
  }
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return CardInfoBuy(
                      controller: controller,
                      product: controller.products[index],
                      addQuantity: () {
                        controller.products[index].calcTotalPricePlus();
                      },
                      subQuantity: () {
                        controller.products[index].calcTotalPriceSub();
                      },
                      removeProduct: () {
                        controller.removeProductOfShoppingCar(
                            controller.products[index]);
                      });
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
