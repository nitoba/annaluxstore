import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:annaluxstore/app/modules/buy/buy_controller.dart';
import 'package:annaluxstore/app/modules/buy/buy_module.dart';

void main() {
  initModule(BuyModule());
  BuyController buyController;
  //
  setUp(() {
    buyController = BuyModule.to.get<BuyController>();
  });

  group('BuyController Test', () {
    test("First Test", () {
      expect(buyController, isInstanceOf<BuyController>());
    });

    test(
        "calcPriceByQuantityPlus should be return a total price and quantity +1",
        () {
      expect(buyController.quantity, 1);
      expect(buyController.totalPrice, 0);

      //buyController.calcPriceByQuantityPlus(30);

      expect(buyController.quantity, 2);
      expect(buyController.totalPrice, 60);
    });

    test(
        "calcPriceByQuantitySub with quantity to 1 should be return the same price sent",
        () {
      expect(buyController.quantity, 1);
      expect(buyController.totalPrice, 0);

      //buyController.calcPriceByQuantitySub(30);

      expect(buyController.quantity, 1);
      expect(buyController.totalPrice, 0);
    });

    test(
        "calcPriceByQuantitySub with quantity to 1 should be return the same price sent",
        () {
      expect(buyController.quantity, 1);
      expect(buyController.totalPrice, 0);

      // buyController.calcPriceByQuantityPlus(30);
      // buyController.calcPriceByQuantityPlus(30);
      // buyController.calcPriceByQuantityPlus(30);

      expect(buyController.quantity, 4);

      expect(buyController.totalPrice, 120);

      // buyController.calcPriceByQuantitySub(30);

      expect(buyController.quantity, 3);
      expect(buyController.totalPrice, 90);
    });
  });
}
