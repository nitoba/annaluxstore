import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final UserModel user;
  const HomePage({Key key, this.title = "Home", this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                controller.logout();
                Modular.to.pushReplacementNamed("/");
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            trailing: Image.network(widget.user.photoUrl),
            title: Text(widget.user.name),
            subtitle: Text(widget.user.email),
          )
        ],
      ),
    );
  }
}
