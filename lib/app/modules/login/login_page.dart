import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            controller.loading
                ? Center(child: CircularProgressIndicator())
                : RaisedButton(
                    child: Text("Login"),
                    onPressed: () async {
                      await controller.loginWithGoogle();
                      Modular.to.pushReplacementNamed("/home",
                          arguments: controller.user);
                    },
                  )
          ],
        );
      }),
    );
  }
}
