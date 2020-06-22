import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  final HomeController _homeController;

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

    ///print(products);
  }

  @action
  removeProductOfShoppingCar(ProductModelStore productModelStore) {
    if (products != null) {
      products.removeWhere((product) => product.id == productModelStore.id);

      _homeController.removeProductToCar(productModelStore.id);
    }
  }
}
