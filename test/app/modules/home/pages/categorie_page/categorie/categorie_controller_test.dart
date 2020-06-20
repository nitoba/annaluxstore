import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/pages/categorie_page/categorie_controller.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  initModule(HomeModule(),
      changeBinds: [Bind<IHomeRepository>((i) => HomeRepositoryMock())]);
  CategorieController categorieController;
  HomeRepositoryMock homeRepositoryMock;
  //
  setUp(() {
    homeRepositoryMock = HomeModule.to.get<IHomeRepository>();
    categorieController = HomeModule.to.get<CategorieController>();
  });

  group('CategorieController Test', () {
    test("First Test", () {
      expect(categorieController, isInstanceOf<CategorieController>());

      expect(homeRepositoryMock, isInstanceOf<HomeRepositoryMock>());
    });

    test(
        "When calll function getProductsbyCategorie should be return the products of categorie",
        () {
      when(homeRepositoryMock.getProductByCategorie('mask'))
          .thenAnswer((_) => Future.value(categorieController.products = [
                ProductModel(categorie: 'Máscaras'),
                ProductModel(categorie: 'Máscaras'),
                ProductModel(categorie: 'Máscaras'),
              ]));

      expect(categorieController.products, isEmpty);
      categorieController.getProductByCategorie('mask');
      expect(categorieController.products, isNotEmpty);
      expect(categorieController.products.length, 3);
      expect(categorieController.products[0].categorie, "Máscaras");
    });
  });
}
