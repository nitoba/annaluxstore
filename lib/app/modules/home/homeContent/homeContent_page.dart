import 'package:annaluxstore/app/modules/home/components/appbar/appbar_widget.dart';
import 'package:annaluxstore/app/modules/home/components/gridview_items/gridview_items_widget.dart';
import 'package:annaluxstore/app/modules/home/components/list_categories/list_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_content_controller.dart';

class HomeContentPage extends StatefulWidget {
  final String title;
  const HomeContentPage({Key key, this.title = "HomeContent"})
      : super(key: key);

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState
    extends ModularState<HomeContentPage, HomeContentController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onPress: () {},
      ),
      body: Container(
        //color: Colors.green,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListCategories(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Últimos Itens",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 32),
            GridViewItems()
          ],
        ),
      ),
    );
  }
}
