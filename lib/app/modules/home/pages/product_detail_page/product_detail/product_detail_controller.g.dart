// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailController on _ProductDetailControllerBase, Store {
  final _$messageBtnAtom =
      Atom(name: '_ProductDetailControllerBase.messageBtn');

  @override
  String get messageBtn {
    _$messageBtnAtom.reportRead();
    return super.messageBtn;
  }

  @override
  set messageBtn(String value) {
    _$messageBtnAtom.reportWrite(value, super.messageBtn, () {
      super.messageBtn = value;
    });
  }

  final _$iconAtom = Atom(name: '_ProductDetailControllerBase.icon');

  @override
  IconData get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(IconData value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$iconFavoriteAtom =
      Atom(name: '_ProductDetailControllerBase.iconFavorite');

  @override
  IconData get iconFavorite {
    _$iconFavoriteAtom.reportRead();
    return super.iconFavorite;
  }

  @override
  set iconFavorite(IconData value) {
    _$iconFavoriteAtom.reportWrite(value, super.iconFavorite, () {
      super.iconFavorite = value;
    });
  }

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

  final _$addFavoritesAsyncAction =
      AsyncAction('_ProductDetailControllerBase.addFavorites');

  @override
  Future addFavorites(ProductModel productModel) {
    return _$addFavoritesAsyncAction
        .run(() => super.addFavorites(productModel));
  }

  final _$_ProductDetailControllerBaseActionController =
      ActionController(name: '_ProductDetailControllerBase');

  @override
  dynamic addToShoppingCar(ProductModel productModel) {
    final _$actionInfo = _$_ProductDetailControllerBaseActionController
        .startAction(name: '_ProductDetailControllerBase.addToShoppingCar');
    try {
      return super.addToShoppingCar(productModel);
    } finally {
      _$_ProductDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageBtn: ${messageBtn},
icon: ${icon},
iconFavorite: ${iconFavorite},
color: ${color},
isAdd: ${isAdd}
    ''';
  }
}
