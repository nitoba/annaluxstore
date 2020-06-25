// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategorieController on _CategorieControllerBase, Store {
  final _$productsAtom = Atom(name: '_CategorieControllerBase.products');

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$getProductByCategorieAsyncAction =
      AsyncAction('_CategorieControllerBase.getProductByCategorie');

  @override
  Future<void> getProductByCategorie(String categorieID) {
    return _$getProductByCategorieAsyncAction
        .run(() => super.getProductByCategorie(categorieID));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
