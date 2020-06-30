import 'package:annaluxstore/app/modules/checkout/checkout_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpeireDate extends StatelessWidget {
  final GlobalKey<FormState> expereDateformKey;
  final TextEditingController expereDateController;
  final CheckoutController controller;

  ExpeireDate({
    Key key,
    this.controller,
    this.expereDateController,
    this.expereDateformKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: expereDateformKey,
      child: TextFormField(
        controller: expereDateController,
        validator: (value) {
          if (value.isEmpty) {
            return "Por favor ensira um cupom válido";
          }
          return null;
        },
        enableInteractiveSelection: false,
        maxLength: 7,
        decoration: InputDecoration(
          helperText: "Data de expiração",
          focusColor: thirdColor,
          suffixIcon: Icon(FontAwesomeIcons.calendarCheck, color: thirdColor),
          hintText: "MM/AAAA",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: thirdColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
