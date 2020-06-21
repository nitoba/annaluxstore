import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentIndex = 0;

  List<String> productsIdsToCar = [];

  @action
  void updateCurrentIndex(int index) {
    this.currentIndex = index;
  }

  void addProductToShoppingCar(String idProduct) {
    if (idProduct != null) {
      productsIdsToCar.add(idProduct);
    }
    print(productsIdsToCar.length);
  }
}
