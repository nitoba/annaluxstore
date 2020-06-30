import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';

import '../checkout_controller.dart';

class CheckoutBtn extends StatelessWidget {
  final CheckoutController controller;
  final Function onPress;
  const CheckoutBtn({
    Key key,
    @required this.onPress,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        height: 60,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 3,
              blurRadius: 3,
              //offset: Offset(1.5, 1.5),
            )
          ],
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPress,
          child: Center(
            child: Text(
              controller.btnMessage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
