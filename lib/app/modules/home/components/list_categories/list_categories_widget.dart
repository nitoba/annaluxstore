import 'package:annaluxstore/app/modules/shared/consttants.dart';
import 'package:flutter/material.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
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
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text("Mascaras")
            ],
          );
        },
      ),
    );
  }
}
