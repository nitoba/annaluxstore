// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuyController on _BuyControllerBase, Store {
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

  final _$totalPriceOfAllProductsAtom =
      Atom(name: '_BuyControllerBase.totalPriceOfAllProducts');

  @override
  double get totalPriceOfAllProducts {
    _$totalPriceOfAllProductsAtom.reportRead();
    return super.totalPriceOfAllProducts;
  }

  @override
  set totalPriceOfAllProducts(double value) {
    _$totalPriceOfAllProductsAtom
        .reportWrite(value, super.totalPriceOfAllProducts, () {
      super.totalPriceOfAllProducts = value;
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
  dynamic removeProductOfShoppingCar(ProductModelStore productModelStore) {
    final _$actionInfo = _$_BuyControllerBaseActionController.startAction(
        name: '_BuyControllerBase.removeProductOfShoppingCar');
    try {
      return super.removeProductOfShoppingCar(productModelStore);
    } finally {
      _$_BuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _calcPriceOfAllProducts() {
    final _$actionInfo = _$_BuyControllerBaseActionController.startAction(
        name: '_BuyControllerBase._calcPriceOfAllProducts');
    try {
      return super._calcPriceOfAllProducts();
    } finally {
      _$_BuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calcPriceTotalByQuantity() {
    final _$actionInfo = _$_BuyControllerBaseActionController.startAction(
        name: '_BuyControllerBase.calcPriceTotalByQuantity');
    try {
      return super.calcPriceTotalByQuantity();
    } finally {
      _$_BuyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
totalPriceOfAllProducts: ${totalPriceOfAllProducts}
    ''';
  }
}
