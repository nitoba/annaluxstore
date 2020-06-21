// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailController on _ProductDetailControllerBase, Store {
  final _$colorAtom = Atom(name: '_ProductDetailControllerBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$isAddAtom = Atom(name: '_ProductDetailControllerBase.isAdd');

  @override
  bool get isAdd {
    _$isAddAtom.reportRead();
    return super.isAdd;
  }

  @override
  set isAdd(bool value) {
    _$isAddAtom.reportWrite(value, super.isAdd, () {
      super.isAdd = value;
    });
  }

  final _$_ProductDetailControllerBaseActionController =
      ActionController(name: '_ProductDetailControllerBase');

  @override
  dynamic addToShoppingCart() {
    final _$actionInfo = _$_ProductDetailControllerBaseActionController
        .startAction(name: '_ProductDetailControllerBase.addToShoppingCart');
    try {
      return super.addToShoppingCart();
    } finally {
      _$_ProductDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
color: ${color},
isAdd: ${isAdd}
    ''';
  }
}
