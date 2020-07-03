import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/checkout/components/exp_date_widget.dart';
import 'package:annaluxstore/app/modules/checkout/components/secure_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'checkout_controller.dart';
import 'components/card_holder_widget.dart';
import 'components/card_number_widget.dart';
import 'components/checkout_btn_widget.dart';
import 'package:lottie/lottie.dart';
import 'components/credit_card_widget.dart';

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
                    CreditCardWidget(
                      controller: controller,
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
