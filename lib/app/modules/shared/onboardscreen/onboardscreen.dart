import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../first_page.dart';

class OnBoardScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: thirdColor.withOpacity(0.7),
      bubbleBackgroundColor: secondColor,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Bem vindo a AnaluxStore',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Produtos feitos sobmedida',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/onb1.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: thirdColor.withOpacity(0.7),
      bubbleBackgroundColor: secondColor,
      iconColor: null,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Compra de maneira fácil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Navegue pelas categorias e encontre tudo aquilo que deseja',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/onb2.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: thirdColor.withOpacity(0.7),
      bubbleBackgroundColor: secondColor,
      iconColor: null,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
            'Tudo no seu celular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Escolha qualquer produto no conforto da sua casa',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/onb3.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              showSkipButton: false,
              doneText: Text(
                "Começar",
              ),
              pageButtonsColor: secondColor,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeenFirtPage extends StatefulWidget {
  @override
  _SeenFirtPageState createState() => _SeenFirtPageState();
}

class _SeenFirtPageState extends State<SeenFirtPage> {
  Future _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FirstPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardScreen()));
    }
  }

  @override
  void initState() {
    _checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: thirdColor);
  }
}
