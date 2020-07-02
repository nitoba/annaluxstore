import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../home_content_controller.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<HomeContentController>().getAllProducts();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Observer(
          builder: (_) {
            List<ProductModel> products =
                Modular.get<HomeContentController>().allProducts;
            if (products.isEmpty) {
              return Center(
                child: Lottie.asset("assets/animation/loading.json",
                    height: 150, width: 150),
              );
            }
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        highlightColor: thirdColor,
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                          tag: '${products[index].id}',
                          child: Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: CachedNetworkImage(
                              placeholder: (_, url) => Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(thirdColor),
                                ),
                              ),
                              imageUrl: products[index].images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          Modular.to.pushNamed(
                            '/home/product',
                            arguments: products[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(products[index].title)
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
