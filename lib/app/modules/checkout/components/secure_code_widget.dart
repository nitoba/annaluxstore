import 'package:annaluxstore/app/modules/checkout/checkout_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecureCode extends StatelessWidget {
  final GlobalKey<FormState> secureCodeformKey;
  final TextEditingController secureCodeController;
  final CheckoutController controller;

  SecureCode(
      {Key key,
      this.controller,
      this.secureCodeController,
      this.secureCodeformKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: secureCodeformKey,
      child: TextFormField(
        controller: secureCodeController,
        validator: (value) {
          if (value.isEmpty) {
            return "Esse campo é obrigatório";
          }
          return null;
        },
        maxLength: 3,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          helperText: "Código de segurança",
          focusColor: thirdColor,
          suffixIcon: Icon(FontAwesomeIcons.lock, color: thirdColor),
          hintText: "Ex: 000",
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
