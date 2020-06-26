import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:annaluxstore/app/modules/favorites/favorites_controller.dart';
import 'package:annaluxstore/app/modules/favorites/favorites_module.dart';

class SharedLocalMock extends Mock implements ISharedLocalRepository {}

void main() {
  initModule(HomeModule(), changeBinds: [
    Bind<ISharedLocalRepository>((i) => SharedLocalMock()),
  ]);
  initModule(FavoritesModule());
  FavoritesController favoritesController;
  HomeController homeController;
  setUp(() {
    favoritesController = FavoritesModule.to.get<FavoritesController>();
    homeController = HomeModule.to.get<HomeController>();
  });

  group('FavoritesController Test', () {
    test("First Test", () {
      expect(favoritesController, isInstanceOf<FavoritesController>());
      expect(homeController, isInstanceOf<HomeController>());
    });

    test(
        'When called getFavoriteProducts should be return a list de favorite products',
        () {
      getFakeDatas(homeController);

      favoritesController.getFavoriteProducts();

      expect(favoritesController.favoriteProducts, isNotEmpty);
      expect(favoritesController.favoriteProducts.length, 3);
    });

    test(
        'When called removeFavoriteProducts should be removed a product the list of favorite products',
        () {
      var product = ProductModelStore(
        id: "123456",
        title: "Roupa de bebe",
        description: "Uma bela roupa de bebe",
        price: 10,
        categorie: "Roupas bebes",
        images: ["imagem1", "image2", "image3"],
      );
      getFakeDatas(homeController);

      favoritesController.removeFavoriteProducts(product);

      expect(favoritesController.favoriteProducts, isNotEmpty);
      expect(favoritesController.favoriteProducts.length, 2);
    });
  });
}

getFakeDatas(HomeController homeController) {
  homeController.favoriteProducts = [
    ProductModel(
      id: "adaadjh6546ada",
      title: "Mascara 3D",
      description: "Uma bela Mascara",
      price: 5,
      categorie: "Mascaras",
      images: ["imagem1", "image2", "image3"],
    ),
    ProductModel(
      id: "oiuasniur",
      title: "Vestido",
      description: "Uma belo vestido",
      price: 10.0,
      categorie: "Vestidos",
      images: ["imagem1", "image2", "image3"],
    ),
    ProductModel(
      id: "123456",
      title: "Roupa de bebe",
      description: "Uma bela roupa de bebe",
      price: 10,
      categorie: "Roupas bebes",
      images: ["imagem1", "image2", "image3"],
    ),
  ];
}
