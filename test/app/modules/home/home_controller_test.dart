import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SharedLocalMock extends Mock implements ISharedLocalRepository {}

void main() {
  initModule(HomeModule(), changeBinds: [
    Bind<ISharedLocalRepository>((i) => SharedLocalMock()),
  ]);
  HomeController homeController;
  ISharedLocalRepository sharedLocalRepository;
  //
  setUp(() {
    homeController = HomeModule.to.get<HomeController>();
    sharedLocalRepository = HomeModule.to.get<ISharedLocalRepository>();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(homeController, isInstanceOf<HomeController>());
      expect(sharedLocalRepository, isInstanceOf<SharedLocalMock>());
    });

    test(
        "When called addProductToCar should be add a product inside list productsToCar",
        () {
      var product = ProductModel(
        id: "adaadjh6546ada",
        title: "Mascara 3D",
        description: "Uma bela Mascara",
        price: 5,
        categorie: "Mascaras",
        images: ["imagem1", "image2", "image3"],
      );

      homeController.addProductToCar(product);

      expect(homeController.productsToCar, isNotEmpty);
      expect(homeController.productsToCar.length, 1);
    });
    test(
        "When called removeProductToCar should be removed a product a list of productsCar",
        () {
      homeController.productsToCar.clear();

      getFakeDatasProductsToCar(homeController);

      homeController.removeProductToCar("adaadjh6546ada");

      expect(homeController.productsToCar, isNotEmpty);
      expect(homeController.productsToCar.length, 2);
    });

    test(
        "When called removeProductToCar should be removed a product a list of favoriteProducts",
        () {
      homeController.favoriteProducts.clear();

      getFakeDatasFavoriteProducts(homeController);

      homeController.removeFavoriteProducts("adaadjh6546ada");

      expect(homeController.favoriteProducts, isNotEmpty);
      expect(homeController.favoriteProducts.length, 2);
    });

    test(
        "When called loadFavoriteProducts should be loaded the favorite products if is save",
        () async {
      homeController.favoriteProducts.clear();

      when(sharedLocalRepository.get("favorites")).thenAnswer(
        (_) => Future.value(
          [
            '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
            '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
          ],
        ),
      );

      await homeController.loadFavoriteProducts();

      expect(homeController.favoriteProducts, isNotEmpty);
      expect(homeController.favoriteProducts.length, 2);
    });

    test(
        "When called loadFavoriteProducts should not to be loaded the favorite products if not save",
        () async {
      homeController.favoriteProducts.clear();

      when(sharedLocalRepository.get("favorites")).thenAnswer(
        (_) => Future.value(null),
      );

      await homeController.loadFavoriteProducts();

      expect(homeController.favoriteProducts, isEmpty);
      expect(homeController.favoriteProducts.length, 0);
    });

    test(
        "When called loadShoppingCartProducts should be loaded the products if is save",
        () async {
      homeController.productsToCar.clear();

      when(sharedLocalRepository.get("cart")).thenAnswer(
        (_) => Future.value(
          [
            '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
            '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
          ],
        ),
      );

      await homeController.loadShoppingCartProducts();

      expect(homeController.productsToCar, isNotEmpty);
      expect(homeController.productsToCar.length, 2);
    });

    test(
        "When called loadShoppingCartProducts should not to be loaded the products if not save",
        () async {
      homeController.productsToCar.clear();

      when(sharedLocalRepository.get("favorites")).thenAnswer(
        (_) => Future.value(null),
      );

      await homeController.loadShoppingCartProducts();

      expect(homeController.favoriteProducts, isEmpty);
      expect(homeController.favoriteProducts.length, 0);
    });

    test(
        "When callded saveFavoriteProducts should be save the favorite products and return true",
        () async {
      homeController.favoriteProducts.clear();

      var datas = [
        '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
        '{"documentID":"adaadjh6546ada","title":"Mascara 3D","description":"Uma bela Mascara", "price":5.0, "categorie":"Mascaras", "images":["imagem1", "image2", "image3"]}',
      ];

      getFakeDatasFavoriteProducts(homeController);

      when(sharedLocalRepository.insert("favorites", datas))
          .thenAnswer((_) => Future.value(true));

      await homeController.saveFavoriteProducts();

      expect(homeController.favoriteProducts.length, 3);
    });
  });
}

getFakeDatasProductsToCar(HomeController homeController) {
  homeController.productsToCar = [
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

getFakeDatasFavoriteProducts(HomeController homeController) {
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
