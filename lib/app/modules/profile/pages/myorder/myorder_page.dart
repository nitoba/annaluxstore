import 'package:annaluxstore/app/modules/profile/pages/myorder/components/order_tracking_widget.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'myorder_controller.dart';

class MyorderPage extends StatefulWidget {
  final String title;
  final UserModel user;
  const MyorderPage({Key key, this.title = "Meus Pedidos", this.user})
      : super(key: key);

  @override
  _MyorderPageState createState() => _MyorderPageState();
}

class _MyorderPageState extends ModularState<MyorderPage, MyorderController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getUserOrders(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.orders.isNotEmpty) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.orders.length,
              itemBuilder: (context, prymaryIndex) {
                var datas = controller.orders[prymaryIndex].orderDate
                    .toDate()
                    .toString()
                    .split(".");
                return Container(
                  height: 550,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: thirdColor.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pedido Nº ${prymaryIndex + 1}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Data: ${datas[0]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: controller
                                    .orders[prymaryIndex].products.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 150,
                                    child: Card(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                    .orders[prymaryIndex]
                                                    .products[index]['image'],
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              title: Text(controller
                                                  .orders[prymaryIndex]
                                                  .products[index]['title']),
                                              subtitle: Text(
                                                  "R\$ ${controller.orders[prymaryIndex].products[index]['price']}"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Status do pedido",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          OrderTracking(
                            orderStatus:
                                controller.orders[prymaryIndex].orderStatus,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          // Future.delayed(Duration(seconds: 3), () {});
          // return Center(
          //   child: Lottie.asset("assets/animation/loading.json",
          //       height: 150, width: 150),
          // );

          return Center(child: Text("Você ainda não tem nenhum pedido"));
        }
      }),
    );
  }
}
