import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  final HomeController _homeController;

  @observable
  ObservableList<ProductModelStore> products;

  @observable
  double totalPriceOfAllProducts = 0;

  @observable
  bool isBusy = false;

  @observable
  String onSucess = '';

  List<Map<String, dynamic>> coupomFounded = [{}];

  List<Map<String, dynamic>> coupons;

  _BuyControllerBase(this._homeController) {
    _getCoupons();
  }

  _getCoupons() {
    coupons = _homeController.coupons;
  }

  @action
  getProductsInCar() {
    var storeProductModel = ProductModelStore();

    products = _homeController.productsToCar
        .map((product) => storeProductModel.transformModel(product))
        .toList()
        .asObservable();

    ///print(products);
    _calcPriceOfAllProducts();
  }

  @action
  removeProductOfShoppingCar(ProductModelStore productModelStore) {
    if (products != null) {
      products.removeWhere((product) => product.id == productModelStore.id);

      _homeController.removeProductToCar(productModelStore.id);
    }
  }

  @action
  _calcPriceOfAllProducts() {
    products.map((product) {
      totalPriceOfAllProducts = totalPriceOfAllProducts + product.price;
    }).toList();

    print(totalPriceOfAllProducts);
  }

  @action
  calcPriceTotalByQuantity() {
    totalPriceOfAllProducts = 0.0;

    products.map((product) {
      totalPriceOfAllProducts += product.quantity * product.price;
    }).toList();
  }

  @action
  applyCoupomDiscount(String text) {
    if (!isBusy) {
      coupomFounded = coupons.where((cupom) => cupom['title'] == text).toList();

      print(coupomFounded);

      if (coupomFounded.isNotEmpty) {
        if (totalPriceOfAllProducts <= coupomFounded[0]['discount']) {
          isBusy = true;
          onSucess = "Aumente a quantidade de produtos";
          print(onSucess);
          Future.delayed(Duration(seconds: 2), () {
            isBusy = false;
          });

          return;
        }

        totalPriceOfAllProducts =
            totalPriceOfAllProducts - coupomFounded[0]['discount'];
        isBusy = true;
        //print(isBusy);
        onSucess = "Seu Cupom foi aplicado!";
        _homeController.coupons.removeWhere(
            (cupom) => cupom['title'] == coupomFounded[0]['title']);
      } else {
        isBusy = true;
        onSucess = "Esse cupom já foi aplicado!";
        Future.delayed(Duration(seconds: 2), () {
          isBusy = false;
        });

        return;
      }
    }
  }
}
