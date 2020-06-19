import 'package:mobx/mobx.dart';

part 'categorie_controller.g.dart';

class CategorieController = _CategorieControllerBase with _$CategorieController;

abstract class _CategorieControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
