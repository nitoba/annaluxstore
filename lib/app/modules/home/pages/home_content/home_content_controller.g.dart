// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeContentController on _HomeContentControllerBase, Store {
  final _$allProductsAtom =
      Atom(name: '_HomeContentControllerBase.allProducts');

  @override
  List<ProductModel> get allProducts {
    _$allProductsAtom.reportRead();
    return super.allProducts;
  }

  @override
  set allProducts(List<ProductModel> value) {
    _$allProductsAtom.reportWrite(value, super.allProducts, () {
      super.allProducts = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_HomeContentControllerBase.categories');

  @override
  List<CategoriesModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoriesModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  @override
  String toString() {
    return '''
allProducts: ${allProducts},
categories: ${categories}
    ''';
  }
}
