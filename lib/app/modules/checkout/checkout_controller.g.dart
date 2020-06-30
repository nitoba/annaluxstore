// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutController on _CheckoutControllerBase, Store {
  final _$cardHeigthAtom = Atom(name: '_CheckoutControllerBase.cardHeigth');

  @override
  double get cardHeigth {
    _$cardHeigthAtom.reportRead();
    return super.cardHeigth;
  }

  @override
  set cardHeigth(double value) {
    _$cardHeigthAtom.reportWrite(value, super.cardHeigth, () {
      super.cardHeigth = value;
    });
  }

  final _$cardNumberAtom = Atom(name: '_CheckoutControllerBase.cardNumber');

  @override
  String get cardNumber {
    _$cardNumberAtom.reportRead();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.reportWrite(value, super.cardNumber, () {
      super.cardNumber = value;
    });
  }

  final _$cardHolderAtom = Atom(name: '_CheckoutControllerBase.cardHolder');

  @override
  String get cardHolder {
    _$cardHolderAtom.reportRead();
    return super.cardHolder;
  }

  @override
  set cardHolder(String value) {
    _$cardHolderAtom.reportWrite(value, super.cardHolder, () {
      super.cardHolder = value;
    });
  }

  final _$cardExpAtom = Atom(name: '_CheckoutControllerBase.cardExp');

  @override
  String get cardExp {
    _$cardExpAtom.reportRead();
    return super.cardExp;
  }

  @override
  set cardExp(String value) {
    _$cardExpAtom.reportWrite(value, super.cardExp, () {
      super.cardExp = value;
    });
  }

  final _$iconCardAtom = Atom(name: '_CheckoutControllerBase.iconCard');

  @override
  IconData get iconCard {
    _$iconCardAtom.reportRead();
    return super.iconCard;
  }

  @override
  set iconCard(IconData value) {
    _$iconCardAtom.reportWrite(value, super.iconCard, () {
      super.iconCard = value;
    });
  }

  final _$opacityAtom = Atom(name: '_CheckoutControllerBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.reportRead();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.reportWrite(value, super.opacity, () {
      super.opacity = value;
    });
  }

  final _$btnMessageAtom = Atom(name: '_CheckoutControllerBase.btnMessage');

  @override
  String get btnMessage {
    _$btnMessageAtom.reportRead();
    return super.btnMessage;
  }

  @override
  set btnMessage(String value) {
    _$btnMessageAtom.reportWrite(value, super.btnMessage, () {
      super.btnMessage = value;
    });
  }

  final _$_CheckoutControllerBaseActionController =
      ActionController(name: '_CheckoutControllerBase');

  @override
  dynamic initCreditCard() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.initCreditCard');
    try {
      return super.initCreditCard();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkout(
      {String cardNumber, String cardHolder, String expDate, String secCode}) {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.checkout');
    try {
      return super.checkout(
          cardNumber: cardNumber,
          cardHolder: cardHolder,
          expDate: expDate,
          secCode: secCode);
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hideAndShowCard() {
    final _$actionInfo = _$_CheckoutControllerBaseActionController.startAction(
        name: '_CheckoutControllerBase.hideAndShowCard');
    try {
      return super.hideAndShowCard();
    } finally {
      _$_CheckoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardHeigth: ${cardHeigth},
cardNumber: ${cardNumber},
cardHolder: ${cardHolder},
cardExp: ${cardExp},
iconCard: ${iconCard},
opacity: ${opacity},
btnMessage: ${btnMessage}
    ''';
  }
}
