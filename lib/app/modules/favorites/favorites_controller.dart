import 'package:mobx/mobx.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
