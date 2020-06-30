import 'package:annaluxstore/app/modules/checkout/checkout_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardNumber extends StatelessWidget {
  final GlobalKey<FormState> cardNumberformKey;
  final TextEditingController cardNumberController;
  final CheckoutController controller;

  CardNumber({
    Key key,
    this.controller,
    this.cardNumberController,
    this.cardNumberformKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cardNumberformKey,
      child: TextFormField(
        controller: cardNumberController,
        validator: (value) {
          if (value.isEmpty) {
            return "Este campo é obrigatório";
          }
          return null;
        },
        maxLength: 16,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          helperText: "Número cartão",
          focusColor: thirdColor,
          suffixIcon: Icon(FontAwesomeIcons.creditCard, color: thirdColor),
          hintText: "Ex: 1234456778901234",
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
