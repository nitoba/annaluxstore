import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'checkout_controller.dart';

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
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.createNewOrder(widget.productsToCar);
      }),
    );
  }
}
