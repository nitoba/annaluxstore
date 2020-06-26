// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$userAtom = Atom(name: '_ProfileControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userAdressAtom = Atom(name: '_ProfileControllerBase.userAdress');

  @override
  AdressModel get userAdress {
    _$userAdressAtom.reportRead();
    return super.userAdress;
  }

  @override
  set userAdress(AdressModel value) {
    _$userAdressAtom.reportWrite(value, super.userAdress, () {
      super.userAdress = value;
    });
  }

  final _$getUserInfosAsyncAction =
      AsyncAction('_ProfileControllerBase.getUserInfos');

  @override
  Future getUserInfos() {
    return _$getUserInfosAsyncAction.run(() => super.getUserInfos());
  }

  final _$getUserAdressAsyncAction =
      AsyncAction('_ProfileControllerBase.getUserAdress');

  @override
  Future getUserAdress(String cep) {
    return _$getUserAdressAsyncAction.run(() => super.getUserAdress(cep));
  }

  final _$loadUserAdressAsyncAction =
      AsyncAction('_ProfileControllerBase.loadUserAdress');

  @override
  Future loadUserAdress() {
    return _$loadUserAdressAsyncAction.run(() => super.loadUserAdress());
  }

  @override
  String toString() {
    return '''
user: ${user},
userAdress: ${userAdress}
    ''';
  }
}
