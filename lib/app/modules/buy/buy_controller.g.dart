// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuyController on _BuyControllerBase, Store {
  final _$totalPriceAtom = Atom(name: '_BuyControllerBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$quantityAtom = Atom(name: '_BuyControllerBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$productsAtom = Atom(name: '_BuyControllerBase.products');

  @override
  ObservableList<ProductModelStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModelStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_BuyControllerBaseActionController =
      ActionController(name: '_BuyControllerBase');

  @override
  dynamic getProductsInCar() {
    final _$actionInfo = _$_BuyControllerBaseActionController.startAction(
        name: '_BuyControllerBase.getProductsInCar');
    try {
      return super.getProductsInCar();
    } finally {
      _$_BuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPrice: ${totalPrice},
quantity: ${quantity},
products: ${products}
    ''';
  }
}
