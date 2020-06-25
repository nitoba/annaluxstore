import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddtoCarBtn extends StatelessWidget {
  const AddtoCarBtn({
    Key key,
    @required this.controller,
    this.onTap,
  }) : super(key: key);

  final ProductDetailController controller;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Observer(builder: (_) {
        return AnimatedContainer(
          height: 60,
          width: MediaQuery.of(context).size.width,
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: controller.color,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                controller.icon,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 16),
              Text(
                controller.messageBtn,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }),
      onTap: onTap,
    );
  }
}
