import 'package:flutter/material.dart';

class GridViewItems extends StatelessWidget {
  final int items;
  final List<String> childItems;
  final List<String> title;
  const GridViewItems({
    Key key,
    this.items,
    this.childItems,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: items,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(childItems[0]),
                ),
                SizedBox(height: 12),
                Text(title[0])
              ],
            );
          },
        ),
      ),
    );
  }
}
