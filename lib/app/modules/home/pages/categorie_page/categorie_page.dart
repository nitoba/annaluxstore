import 'package:annaluxstore/app/modules/home/pages/categorie_page/categorie_controller.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriePage extends StatefulWidget {
  final String title;
  final String id;
  const CategoriePage({Key key, this.title = "Categorie", this.id})
      : super(key: key);

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState
    extends ModularState<CategoriePage, CategorieController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getProductOfCategorie(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(builder: (_) {
          if (controller.products.isNotEmpty) {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                placeholder: (_, url) => Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        thirdColor),
                                  ),
                                ),
                                imageUrl: controller.products[index].images[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(controller.products[index].title),
                          Text("R\$ ${controller.products[index].price}"),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
              ),
            );
          }
        }),
      ),
    );
  }
}
