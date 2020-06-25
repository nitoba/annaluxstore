import 'package:annaluxstore/app/modules/shared/components/buttom_widget.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Center(
                  child: Container(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Bem vindo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "encontre as melhores peças em roupas aqui",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 42),
                controller.loading
                    ? Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(thirdColor)),
                      )
                    : ButtonWidget(
                        title: "Login com Google",
                        icon: FontAwesomeIcons.google,
                        onPress: () async {
                          await controller.loginWithGoogle();
                          Modular.to.pushReplacementNamed("home",
                              arguments: controller.user);
                        },
                      ),
                SizedBox(height: 32),
                Divider(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            "@analuxstore",
                            style: TextStyle(color: thirdColor),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text("App by nito_b.a")
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
