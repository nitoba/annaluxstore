import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/components/btn_add_to_car/addtocar_widget.dart';
import 'package:annaluxstore/app/modules/shared/components/buttom_widget.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../product_detail_controller.dart';

class DetailProduct extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String categorie;
  final String description;
  final Function onPress;
  const DetailProduct({
    Key key,
    @required this.title,
    @required this.price,
    @required this.categorie,
    @required this.description,
    @required this.onPress,
    @required this.controller,
    @required this.id,
  }) : super(key: key);

  final ProductDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              categorie,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: thirdColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "R\$ $price",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Descrição:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            ButtonWidget(
              title: "Comprar",
              icon: FontAwesomeIcons.shoppingBag,
              onPress: onPress,
            ),
            SizedBox(height: 12),
            AddtoCarBtn(
              controller: controller,
              onTap: () {
                controller.addToShoppingCar(id);
              },
            )
          ],
        ),
      ),
    );
  }
}
