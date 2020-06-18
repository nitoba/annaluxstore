import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'buy_controller.dart';

class BuyPage extends StatefulWidget {
  final String title;
  const BuyPage({Key key, this.title = "Buy"}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends ModularState<BuyPage, BuyController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: 100,
          width: 100,
        ));
  }
}
