// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategorieController on _CategorieControllerBase, Store {
  final _$valueAtom = Atom(name: '_CategorieControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CategorieControllerBaseActionController =
      ActionController(name: '_CategorieControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CategorieControllerBaseActionController.startAction(
        name: '_CategorieControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CategorieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
