import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final BuyController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          controller.icon,
          color: controller.color,
        ),
        SizedBox(height: 12),
        Text(
          controller.onSucess,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
