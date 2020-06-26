import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/card_info_buy_widget.dart';
import 'components/coupom_widget.dart';
import 'components/finish_buy_btn_widget.dart';
import 'components/message_widget.dart';

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

  @override
  void dispose() {
    Modular.get<HomeController>().saveProductsInCart();
    super.dispose();
  }

  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();

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
                        controller.calcPriceTotalByQuantity();
                      },
                      subQuantity: () {
                        controller.products[index].calcTotalPriceSub();
                        controller.calcPriceTotalByQuantity();
                      },
                      removeProduct: () {
                        controller.removeProductOfShoppingCar(
                            controller.products[index]);
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        "Preço total:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "R\$ ${controller.totalPriceOfAllProducts.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      !controller.isBusy
                          ? CoupomFormField(
                              formKey: _formKey,
                              controller: controller,
                            )
                          : MessageWidget(controller: controller),
                      Spacer(),
                      FinishBuyBtn(controller: controller, onPress: () {})
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
