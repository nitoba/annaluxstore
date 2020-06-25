// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  final _$favoriteProductsAtom =
      Atom(name: '_FavoritesControllerBase.favoriteProducts');

  @override
  ObservableList<ProductModelStore> get favoriteProducts {
    _$favoriteProductsAtom.reportRead();
    return super.favoriteProducts;
  }

  @override
  set favoriteProducts(ObservableList<ProductModelStore> value) {
    _$favoriteProductsAtom.reportWrite(value, super.favoriteProducts, () {
      super.favoriteProducts = value;
    });
  }

  final _$_FavoritesControllerBaseActionController =
      ActionController(name: '_FavoritesControllerBase');

  @override
  dynamic getFavoriteProducts() {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase.getFavoriteProducts');
    try {
      return super.getFavoriteProducts();
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteProducts: ${favoriteProducts}
    ''';
  }
}
