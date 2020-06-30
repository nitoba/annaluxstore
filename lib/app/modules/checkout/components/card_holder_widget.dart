import 'package:annaluxstore/app/modules/checkout/checkout_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardHolder extends StatelessWidget {
  final GlobalKey<FormState> cardHolderformKey;
  final TextEditingController cardHolderController;
  final CheckoutController controller;

  CardHolder(
      {Key key,
      this.controller,
      this.cardHolderController,
      this.cardHolderformKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cardHolderformKey,
      child: TextFormField(
        controller: cardHolderController,
        validator: (value) {
          if (value.isEmpty) {
            return "Esse campo é obrigatório";
          }
          return null;
        },
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          helperText: "Proprietário do cartão",
          focusColor: thirdColor,
          suffixIcon: Icon(FontAwesomeIcons.user, color: thirdColor),
          hintText: "Ex: João da Costa Silva",
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
        onFieldSubmitted: (value) {},
      ),
    );
  }
}
