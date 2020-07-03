import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';

class FinishBuyBtn extends StatelessWidget {
  final BuyController controller;
  final Function onPress;
  const FinishBuyBtn({
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
          color: controller.products.isEmpty ||
                  controller.deliveryRate.title ==
                      "Endereço fora do\nraio de entrega"
              ? Colors.grey
              : thirdColor,
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
          onPressed: controller.products.isEmpty ||
                  controller.deliveryRate.title ==
                      "Endereço fora do\nraio de entrega"
              ? null
              : onPress,
          child: Center(
            child: Text(
              "Pagamento",
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
