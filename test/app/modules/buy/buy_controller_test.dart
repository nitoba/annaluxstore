import 'package:annaluxstore/app/app_module.dart';
import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/buy/buy_module.dart';
import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:annaluxstore/app/modules/buy/repositories/interfaces/buy_repository_interface.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';

import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SharedLocalMock extends Mock implements ISharedLocalRepository {}

class BuyRepositoryMock extends Mock implements IBuyRepository {}

class AuthRepositoryMock extends Mock implements IAuthRepository {}

class HomeRepositortyMock extends Mock implements IHomeRepository {}

main() {
  WidgetsFlutterBinding.ensureInitialized();

  BuyController buyController;
  ISharedLocalRepository sharedLocalRepository;
  IBuyRepository buyRepository;
  HomeController homeController;

  setUp(() {
    initModule(AppModule(), changeBinds: [
      Bind<ISharedLocalRepository>((i) => SharedLocalMock()),
    ]);
    initModule(HomeModule(), changeBinds: [
      Bind<IAuthRepository>((i) => AuthRepositoryMock()),
      Bind<IHomeRepository>((i) => HomeRepositortyMock()),
    ]);

    initModule(BuyModule(), changeBinds: [
      Bind<IBuyRepository>((i) => BuyRepositoryMock()),
    ]);
    sharedLocalRepository = AppModule.to.get<ISharedLocalRepository>();
    buyRepository = BuyModule.to.get<IBuyRepository>();
    homeController = HomeController(
        sharedLocalRepository,
        HomeModule.to.get<IHomeRepository>(),
        HomeModule.to.get<IAuthRepository>());
    buyController =
        BuyController(homeController, sharedLocalRepository, buyRepository);
    //homeController.productsToCar = [];
  });
  test("Firt Step", () {
    expect(buyController, isInstanceOf<BuyController>());
    expect(sharedLocalRepository, isInstanceOf<SharedLocalMock>());
    expect(buyRepository, isInstanceOf<IBuyRepository>());
    expect(homeController, isInstanceOf<HomeController>());
  });

  test('When call function getCoupons should be return a list of coupons',
      () async {
    expect(buyController.coupons, null);
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(title: "ANNA10", discount: 10),
          CoupomModel(title: "STORE5", discount: 5),
          CoupomModel(title: "ANNA15", discount: 15),
        ]));

    await buyController.getCoupons();

    expect(buyController.coupons, isNotEmpty);
    expect(buyController.coupons.length, 3);
  });

  test(
      'When call function getProductsInCar should be return a list of products of the cart',
      () {
    expect(buyController.products, null);

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    expect(buyController.products, isNotEmpty);
    expect(buyController.products.length, 3);
    expect(buyController.products[0], isInstanceOf<ProductModelStore>());
    expect(buyController.products[1], isInstanceOf<ProductModelStore>());
    expect(buyController.products[2], isInstanceOf<ProductModelStore>());
    expect(buyController.totalPriceOfAllProducts, 25);
  });

  test(
      'When call function removeProductOfShoppingCar should be removed a product of list',
      () {
    buyController.products = null;

    expect(buyController.products, null);

    var product = ProductModelStore(
      id: "123456",
      title: "Roupa de bebe",
      description: "Uma bela roupa de bebe",
      price: 10,
      categorie: "Roupas bebes",
      images: ["imagem1", "image2", "image3"],
    );
    expect(buyController.products, null);

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    expect(buyController.products, isNotEmpty);
    expect(buyController.products.length, 3);

    expect(buyController.totalPriceOfAllProducts, 25);

    buyController.removeProductOfShoppingCar(product);
    homeController.removeProductToCar(product.id);

    expect(buyController.products.length, 2);
    expect(homeController.productsToCar.length, 2);
    expect(homeController.productsToCar.length, 2);

    expect(buyController.totalPriceOfAllProducts, 15);
  });

  test(
      'When increase the quantity products, calcTotalPriceByQuantity should be return a total price',
      () {
    getFakeDatas(homeController);

    buyController.getProductsInCar();

    buyController.products[0].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();
    buyController.products[0].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();

    expect(buyController.products[0].totalPrice, 15);

    expect(buyController.totalPriceOfAllProducts, 35);

    buyController.products[1].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();
    buyController.products[1].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();

    expect(buyController.products[1].totalPrice, 30);

    expect(buyController.totalPriceOfAllProducts, 55);
  });

  test(
      'When decrease the quantity products, calcTotalPriceByQuantity should be return a total price',
      () {
    getFakeDatas(homeController);

    buyController.getProductsInCar();

    buyController.products[0].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();
    buyController.products[0].calcTotalPricePlus();
    buyController.calcPriceTotalByQuantity();

    expect(buyController.products[0].totalPrice, 15);

    expect(buyController.totalPriceOfAllProducts, 35);

    buyController.products[0].calcTotalPriceSub();
    buyController.calcPriceTotalByQuantity();
    buyController.products[0].calcTotalPriceSub();
    buyController.calcPriceTotalByQuantity();

    expect(buyController.products[0].totalPrice, 5);

    expect(buyController.totalPriceOfAllProducts, 25);

    buyController.products[0].calcTotalPriceSub();
    buyController.calcPriceTotalByQuantity();

    expect(buyController.products[0].totalPrice, 5);

    expect(buyController.totalPriceOfAllProducts, 25);
  });

  test(
      'When apply coupom already save local should be return coupom already apply',
      () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 10),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    when(sharedLocalRepository.get('coupons')).thenAnswer((realInvocation) =>
        Future.value(['{"documentID":"asd","title":"ANNA10","discount":10}']));

    await buyController.getCoupons();

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA10');

    expect(buyController.totalPriceOfAllProducts, 25);
    expect(buyController.onSucess, "Cupom já foi aplicado");

    // expect(buyController.totalPriceOfAllProducts, 15);
  });

  test(
      'Apply Coupom when the total price is smaller than discount should not apply discount',
      () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 30),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    when(sharedLocalRepository.get('coupons'))
        .thenAnswer((realInvocation) => Future.value([]));

    await buyController.getCoupons();

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA10');

    expect(buyController.totalPriceOfAllProducts, 25);

    expect(buyController.onSucess, "Preço total inferior ao desconto");
  });

  test(
      'Apply Coupom when the total price is bigger than discount should be return total price minus discount',
      () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 10),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    when(sharedLocalRepository.get('coupons'))
        .thenAnswer((realInvocation) => Future.value([]));

    await buyController.getCoupons();

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA10');

    expect(buyController.totalPriceOfAllProducts, 15);

    expect(buyController.onSucess, "Seu Cupom foi aplicado!");
  });

  test('Apply Coupom and save local', () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 10),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    when(sharedLocalRepository.get('coupons'))
        .thenAnswer((realInvocation) => Future.value([]));

    when(sharedLocalRepository.insert(
            'coupons', ['{"documentID":"asd","title":"ANNA10","discount":10}']))
        .thenAnswer((realInvocation) => Future.value());

    await buyController.getCoupons();

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA10');

    expect(buyController.totalPriceOfAllProducts, 15);

    expect(buyController.onSucess, "Seu Cupom foi aplicado!");
  });

  test('When Apply Coupom invalid shold be return message invalid coupom',
      () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 10),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    await buyController.getCoupons();

    getFakeDatas(homeController);

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA20');

    expect(buyController.totalPriceOfAllProducts, 25);

    expect(buyController.onSucess, "Cupom inválido, tente outro");
  });

  test('When Apply Coupom and there are not products in cart', () async {
    buyController.totalPriceOfAllProducts = 0;
    when(buyRepository.getCoupons()).thenAnswer((_) => Future.value([
          CoupomModel(id: "asd", title: "ANNA10", discount: 10),
          CoupomModel(id: "ads", title: "STORE5", discount: 5),
          CoupomModel(id: "ssd", title: "ANNA15", discount: 15),
        ]));

    await buyController.getCoupons();

    buyController.getProductsInCar();

    await buyController.applyCoupomDiscount('ANNA10');

    expect(buyController.totalPriceOfAllProducts, 0);

    expect(buyController.onSucess, "Sem produtos no carrinho");
  });
}

getFakeDatas(homeController) {
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
