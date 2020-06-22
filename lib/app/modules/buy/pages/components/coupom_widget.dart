import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoupomWidget extends StatelessWidget {
  final Function applyCupom;
  final GlobalKey<FormState> formKey;
  const CoupomWidget({
    Key key,
    @required this.applyCupom,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListTile(
        title: TextFormField(
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
          onPressed: applyCupom,
        ),
      ),
    );
  }
}
