import 'package:annaluxstore/app/modules/home/homeContent/home_content_controller.dart';
import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
            return Center(child: CircularProgressIndicator());
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
                        child: Image.network(categories[index].image),
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
