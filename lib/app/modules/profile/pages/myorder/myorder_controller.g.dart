// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myorder_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyorderController on _MyorderControllerBase, Store {
  final _$ordersAtom = Atom(name: '_MyorderControllerBase.orders');

  @override
  List<OrderModel> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(List<OrderModel> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  final _$getUserOrdersAsyncAction =
      AsyncAction('_MyorderControllerBase.getUserOrders');

  @override
  Future getUserOrders(UserModel userModel) {
    return _$getUserOrdersAsyncAction.run(() => super.getUserOrders(userModel));
  }

  @override
  String toString() {
    return '''
orders: ${orders}
    ''';
  }
}
