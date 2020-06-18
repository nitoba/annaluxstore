import 'package:mobx/mobx.dart';

part 'buy_controller.g.dart';

class BuyController = _BuyControllerBase with _$BuyController;

abstract class _BuyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
