import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'categorie_controller.dart';

class CategoriePage extends StatefulWidget {
  final String title;
  const CategoriePage({Key key, this.title = "Categorie"}) : super(key: key);

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState
    extends ModularState<CategoriePage, CategorieController> {
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
    );
  }
}
