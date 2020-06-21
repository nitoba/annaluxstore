import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  @observable
  double totalPrice = 0;

  @observable
  int quantity = 1;

  @action
  void calcPriceByQuantityPlus(double price) {
    quantity++;
    totalPrice = price * quantity;
    print(totalPrice);
  }

  @action
  void calcPriceByQuantitySub(double price) {
    if (quantity == 1) {
      return;
    } else {
      quantity--;
      totalPrice = price * quantity;
      print(totalPrice);
    }
  }
}
