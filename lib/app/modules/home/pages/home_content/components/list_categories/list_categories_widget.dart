import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../home_content_controller.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<HomeContentController>().getCategories();
    return Container(
      height: 250,
      child: Observer(
        builder: (_) {
          List<CategoriesModel> categories =
              Modular.get<HomeContentController>().categories;
          if (categories.isEmpty) {
            return Center(
              child: Lottie.asset("assets/animation/loading.json",
                  height: 150, width: 150),
            );
          } else {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (contenxt, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, top: 18),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: thirdColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            placeholder: (_, url) => Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(thirdColor),
                              ),
                            ),
                            imageUrl: categories[index].image,
                          ),
                        ),
                        onTap: () {
                          Modular.to.pushNamed(
                            '/home/categorie/${categories[index].id}/${categories[index].title}',
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(categories[index].title)
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
