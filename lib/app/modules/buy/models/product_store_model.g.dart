// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductModelStore on _ProductModelStoreBase, Store {
  final _$idAtom = Atom(name: '_ProductModelStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_ProductModelStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_ProductModelStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$imagesAtom = Atom(name: '_ProductModelStoreBase.images');

  @override
  List<dynamic> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<dynamic> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$priceAtom = Atom(name: '_ProductModelStoreBase.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$categorieAtom = Atom(name: '_ProductModelStoreBase.categorie');

  @override
  String get categorie {
    _$categorieAtom.reportRead();
    return super.categorie;
  }

  @override
  set categorie(String value) {
    _$categorieAtom.reportWrite(value, super.categorie, () {
      super.categorie = value;
    });
  }

  final _$quantityAtom = Atom(name: '_ProductModelStoreBase.quantity');

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

  final _$totalPriceAtom = Atom(name: '_ProductModelStoreBase.totalPrice');

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

  final _$_ProductModelStoreBaseActionController =
      ActionController(name: '_ProductModelStoreBase');

  @override
  dynamic calcTotalPricePlus() {
    final _$actionInfo = _$_ProductModelStoreBaseActionController.startAction(
        name: '_ProductModelStoreBase.calcTotalPricePlus');
    try {
      return super.calcTotalPricePlus();
    } finally {
      _$_ProductModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calcTotalPriceSub() {
    final _$actionInfo = _$_ProductModelStoreBaseActionController.startAction(
        name: '_ProductModelStoreBase.calcTotalPriceSub');
    try {
      return super.calcTotalPriceSub();
    } finally {
      _$_ProductModelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description},
images: ${images},
price: ${price},
categorie: ${categorie},
quantity: ${quantity},
totalPrice: ${totalPrice}
    ''';
  }
}
