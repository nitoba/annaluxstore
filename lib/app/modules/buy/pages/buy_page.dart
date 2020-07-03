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
    controller.applyDeliveryRate();

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
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Taxa de entrega:\nBairro: ${controller.deliveryRate.title}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "R\$ ${controller.deliveryRate.rate.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        if (controller.cupomApply)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cupom de desconto:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "R\$ ${controller.coupomFounded[0].discount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Preço total:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "R\$ ${controller.totalPriceOfAllProducts.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        !controller.isBusy
                            ? CoupomFormField(
                                formKey: _formKey,
                                controller: controller,
                              )
                            : Center(
                                child: MessageWidget(controller: controller)),
                        Spacer(),
                        FinishBuyBtn(
                          controller: controller,
                          onPress: () {
                            controller.applyDeliveryRate();
                            // Modular.to.pushNamed("/checkout",
                            //     arguments: controller.products);
                          },
                        )
                      ],
                    ),
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
