import 'package:annaluxstore/app/modules/profile/profile_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../extensions/loader.dart';

class Location extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey;
  final ProfileController controller;
  Location({Key key, this.formKey, this.controller}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: textEditingController,
            validator: (value) {
              if (value.isEmpty) {
                return "Esse campo é obrigatório";
              } else if (value.length > 8 || value.length < 8) {
                return "Informe cep com 8 numeros";
              } else if (value.contains("-")) {
                return "Informe cep apenas com numeros";
              }
              return null;
            },
            focusNode: FocusNode(),
            enableInteractiveSelection: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusColor: thirdColor,
              prefixIcon:
                  Icon(FontAwesomeIcons.searchLocation, color: thirdColor),
              hintText: "Informe o CEP",
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: thirdColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Fechar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              FlatButton(
                color: thirdColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Buscar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    showLoader(context);
                    await controller.getUserAdress(textEditingController.text);
                    hideLoader(context);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
