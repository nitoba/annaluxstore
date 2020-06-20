import 'package:annaluxstore/app/modules/home/models/categories_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/pages/home_content/home_content_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';

import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  initModule(
    HomeModule(),
    changeBinds: [
      Bind<IHomeRepository>((i) => HomeRepositoryMock()),
    ],
  );
  HomeRepositoryMock homeRepositoryMock;
  HomeContentController homeContentController;
  //
  setUp(() {
    homeRepositoryMock = HomeModule.to.get<IHomeRepository>();
    homeContentController = HomeModule.to.get<HomeContentController>();
  });

  group('HomeContentController Test', () {
    test("First Test", () {
      expect(homeContentController, isInstanceOf<HomeContentController>());
      expect(homeRepositoryMock, isInstanceOf<HomeRepositoryMock>());
    });

    test(
      "When called the function getCategories should be return all categories of the database",
      () async {
        expect(homeContentController.categories, isEmpty);
        when(homeRepositoryMock.getCategories())
            .thenAnswer((_) => Future.value(homeContentController.categories = [
                  CategoriesModel(),
                  CategoriesModel(),
                  CategoriesModel(),
                ]));

        await homeContentController.getCategories();
        expect(homeContentController.categories, isNotEmpty);
        expect(homeContentController.categories.length, 3);
      },
    );
    test(
      "When called the function getCategories should be return categories empty",
      () async {
        expect(homeContentController.categories, isEmpty);
        when(homeRepositoryMock.getCategories()).thenAnswer(
            (_) => Future.value(homeContentController.categories = []));

        await homeContentController.getCategories();
        expect(homeContentController.categories, isEmpty);
        expect(homeContentController.categories.length, 0);
      },
    );

    test(
      "When called the function getAllProducts should be return all products inside the database",
      () async {
        expect(homeContentController.allProducts, isEmpty);
        when(homeRepositoryMock.getAllProducts())
            .thenAnswer((_) => Future.value(
                  homeContentController.allProducts = [
                    ProductModel(),
                    ProductModel(),
                    ProductModel(),
                    ProductModel(),
                  ],
                ));

        await homeContentController.getAllProducts();
        expect(homeContentController.allProducts, isNotEmpty);
        expect(
            homeContentController.allProducts[0], isInstanceOf<ProductModel>());

        expect(homeContentController.allProducts.length, 4);
      },
    );
  });
}
