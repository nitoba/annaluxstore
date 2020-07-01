import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/checkout/components/exp_date_widget.dart';
import 'package:annaluxstore/app/modules/checkout/components/secure_code_widget.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'checkout_controller.dart';
import 'components/card_holder_widget.dart';
import 'components/card_number_widget.dart';
import 'components/checkout_btn_widget.dart';
import 'package:lottie/lottie.dart';

class CheckoutPage extends StatefulWidget {
  final String title;
  final List<ProductModelStore> productsToCar;
  const CheckoutPage({Key key, this.title = "Checkout", this.productsToCar})
      : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState
    extends ModularState<CheckoutPage, CheckoutController> {
  final GlobalKey<FormState> cardNumberformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cardHolderformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> expereDateformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> secureCodeformKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expereDateController = TextEditingController();
  final TextEditingController secureCodeController = TextEditingController();

  @override
  void initState() {
    controller.initCreditCard();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: true,
      body: Observer(
        builder: (_) {
          if (controller.orderFinish) {
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Lottie.asset(
                        'assets/animation/sucess.json',
                        repeat: false,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "Pedido Concluído",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adicionar cartão de crédito",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        AnimatedContainer(
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16),
                          height: controller.cardHeigth,
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: thirdColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: controller.cardHeigth == 200
                              ? AnimatedOpacity(
                                  opacity: controller.opacity,
                                  duration: Duration(milliseconds: 100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            controller.iconCard,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          MaterialButton(
                                            shape: CircleBorder(),
                                            child: Icon(
                                              FontAwesomeIcons.arrowUp,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              controller.hideAndShowCard();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        controller.cardNumber,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 26),
                                      Row(
                                        children: [
                                          Text(
                                            controller.cardHolder.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            controller.cardExp,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : MaterialButton(
                                  shape: CircleBorder(),
                                  child: Icon(
                                    FontAwesomeIcons.arrowDown,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    controller.hideAndShowCard();
                                  },
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    CardNumber(
                      cardNumberformKey: cardNumberformKey,
                      cardNumberController: cardNumberController,
                      controller: controller,
                    ),
                    SizedBox(height: 12),
                    CardHolder(
                      cardHolderformKey: cardHolderformKey,
                      cardHolderController: cardHolderController,
                      controller: controller,
                    ),
                    SizedBox(height: 12),
                    ExpeireDate(
                      expereDateformKey: expereDateformKey,
                      expereDateController: expereDateController,
                      controller: controller,
                    ),
                    SizedBox(height: 12),
                    SecureCode(
                      secureCodeformKey: secureCodeformKey,
                      secureCodeController: secureCodeController,
                      controller: controller,
                    ),
                    SizedBox(height: 120),
                    CheckoutBtn(
                      controller: controller,
                      onPress: () {
                        if (cardNumberformKey.currentState.validate() &&
                            cardHolderformKey.currentState.validate() &&
                            expereDateformKey.currentState.validate() &&
                            secureCodeformKey.currentState.validate()) {
                          controller.checkout(
                            cardNumber: cardNumberController.text,
                            cardHolder: cardHolderController.text,
                            expDate: expereDateController.text,
                            secCode: secureCodeController.text,
                          );

                          controller.createNewOrder(widget.productsToCar);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
