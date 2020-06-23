import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoupomFormField extends StatelessWidget {
  //final Function applyCupom;
  final TextEditingController textEditingController = TextEditingController();
  final BuyController controller;
  final GlobalKey<FormState> formKey;

  CoupomFormField({
    Key key,
    //@required this.applyCupom,
    this.formKey,
    this.controller,
    //this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListTile(
        title: TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (value.isEmpty) {
              return "Por favor ensira um cupom válido";
            }
            return null;
          },
          focusNode: FocusNode(),
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            focusColor: thirdColor,
            suffixIcon: Icon(FontAwesomeIcons.gift, color: thirdColor),
            hintText: "Cupom desconto",
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
        trailing: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            FontAwesomeIcons.check,
            color: thirdColor,
          ),
          onPressed: () {
            if (formKey.currentState.validate()) {
              //print(textEditingController.text);
              controller.applyCoupomDiscount(textEditingController.text);
            } else {
              print("texto inválido");
            }
          },
        ),
      ),
    );
  }
}
