import 'package:annaluxstore/app/modules/checkout/checkout_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final CheckoutController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adicionar cartão de crédito",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          AnimatedContainer(
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            height: controller.cardHeigth,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: thirdColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: controller.cardHeigth == 200
                ? AnimatedOpacity(
                    opacity: controller.opacity,
                    duration: Duration(milliseconds: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              controller.iconCard,
                              color: Colors.white,
                              size: 40,
                            ),
                            MaterialButton(
                                shape: CircleBorder(),
                                child: Icon(
                                  FontAwesomeIcons.arrowUp,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  controller.hideAndShowCard();
                                })
                          ],
                        ),
                        SizedBox(height: 40),
                        Text(
                          controller.cardNumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 26),
                        Row(
                          children: [
                            Text(
                              controller.cardHolder.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              controller.cardExp,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : MaterialButton(
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.arrowDown,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      controller.hideAndShowCard();
                    }),
          ),
        ],
      );
    });
  }
}
