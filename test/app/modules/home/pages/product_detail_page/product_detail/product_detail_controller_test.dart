import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';

import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/product_detail_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class SharedLocalMock extends Mock implements ISharedLocalRepository {}

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<ISharedLocalRepository>((i) => SharedLocalMock()),
  ]);
  initModule(HomeModule());
  ProductDetailController productDetailController;
  HomeController homeController;
  //
  setUp(() {
    homeController = HomeModule.to.get<HomeController>();
    productDetailController = HomeModule.to.get<ProductDetailController>();
  });

  group('ProductDetailController Test', () {
    test("First Test", () {
      expect(productDetailController, isInstanceOf<ProductDetailController>());
    });
    test(
        "When call the function addToShoppingCar and list empty shold be return more one product in ShoppingCart",
        () {
      var productModel = ProductModel(
        id: "123456",
        title: "Roupa de bebe",
        description: "Uma bela roupa de bebe",
        price: 10,
        categorie: "Roupas bebes",
        images: ["imagem1", "image2", "image3"],
      );

      productDetailController.addToShoppingCar(productModel);

      expect(homeController.productsToCar, isNotEmpty);
      expect(homeController.productsToCar.length, 1);
      expect(productDetailController.messageBtn, "Adicionado ao carrinho");
    });
    test(
        "When call the function addToShoppingCar and list IsNotEmpty shold be return more one product in ShoppingCart",
        () {
      homeController.productsToCar = [];
      var productModel = ProductModel(
        id: "123456",
        title: "Roupa de bebe",
        description: "Uma bela roupa de bebe",
        price: 10,
        categorie: "Roupas bebes",
        images: ["imagem1", "image2", "image3"],
      );

      productDetailController.addToShoppingCar(productModel);

      expect(homeController.productsToCar, isNotEmpty);
      expect(homeController.productsToCar.length, 1);
      expect(productDetailController.messageBtn, "Adicionado ao carrinho");

      productDetailController.addToShoppingCar(productModel);
      expect(productDetailController.messageBtn, "Item já adicionado");
    });
  });
}
