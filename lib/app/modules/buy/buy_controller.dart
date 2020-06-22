import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  final HomeController _homeController;
  @observable
  double totalPrice = 0;

  @observable
  int quantity = 1;

  @observable
  ObservableList<ProductModelStore> products;

  _BuyControllerBase(this._homeController);

  @action
  getProductsInCar() {
    var storeProductModel = ProductModelStore();

    products = _homeController.productsToCar
        .map((product) => storeProductModel.transformModel(product))
        .toList()
        .asObservable();

    print(products);
  }

  // @action
  // void calcPriceByQuantityPlus(ProductModel productModel) {
  //   var product = products.where((element) => element == productModel).toList();
  //   quantity++;
  //   totalPrice = product[0].price * quantity;
  //   print(totalPrice);
  // }

  // @action
  // void calcPriceByQuantitySub(double price) {
  //   if (quantity == 1) {
  //     return;
  //   } else {
  //     quantity--;
  //     totalPrice = price * quantity; //90 = 30 * 3 soma// //60 = 30 * 2
  //     print(totalPrice);
  //   }
  // }

  //products = _homeController.productsToCar.asObservable();

}
