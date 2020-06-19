import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_content_controller.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FutureBuilder<List<CategoriesModel>>(
        future: Modular.get<HomeContentController>().getCategories(),
        builder: (context, snapshot) {
          List<CategoriesModel> categories = snapshot.data;
          if (categories == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(thirdColor),
              ),
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
                      padding: const EdgeInsets.only(right: 10.0, top: 32),
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
                          )),
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
