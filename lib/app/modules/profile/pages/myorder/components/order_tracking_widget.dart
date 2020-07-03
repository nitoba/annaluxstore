import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class OrderTracking extends StatelessWidget {
  final String orderStatus;

  const OrderTracking({Key key, this.orderStatus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: orderStatus == "preparando"
                          ? thirdColor
                          : Colors.grey,
                      child: Icon(Feather.loader, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Preparando...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 18),
                  width: 3,
                  height: 25,
                  color: orderStatus == "preparando" ? thirdColor : Colors.grey,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          orderStatus == "caminho" ? thirdColor : Colors.grey,
                      child: Icon(Feather.truck, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "A caminho...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 18),
                  width: 3,
                  height: 25,
                  color: orderStatus == "caminho" ? thirdColor : Colors.grey,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          orderStatus == "entregue" ? thirdColor : Colors.grey,
                      child: Icon(Feather.home, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Entregue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
