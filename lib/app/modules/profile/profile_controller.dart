import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
