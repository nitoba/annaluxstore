import 'package:annaluxstore/app/modules/profile/models/order_model.dart';
import 'package:annaluxstore/app/modules/profile/repositories/order/order_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'myorder_controller.g.dart';

class MyorderController = _MyorderControllerBase with _$MyorderController;

abstract class _MyorderControllerBase with Store {
  final IMyOrderRepository _myOrderRepository;

  @observable
  List<OrderModel> orders = [];
  List<String> tracking = ["preparando", "a caminho", "entregue"];

  _MyorderControllerBase(this._myOrderRepository);

  @action
  getUserOrders(UserModel userModel) async {
    orders = await _myOrderRepository.getOrdersByUser(userModel);
  }
}
