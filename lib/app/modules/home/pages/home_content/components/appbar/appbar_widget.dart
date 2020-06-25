import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends AppBar {
  final Function onPress;
  AppBarWidget({this.onPress})
      : super(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "AnnaluxStore",
            style: TextStyle(
                color: thirdColor, fontWeight: FontWeight.bold, fontSize: 28),
          ),
          actions: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.shoppingCart,
                size: 24,
                color: thirdColor,
              ),
              onPressed: onPress,
            )
          ],
        );
}
