import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key key, this.title = "Favorites"}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends ModularState<FavoritesPage, FavoritesController> {
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
