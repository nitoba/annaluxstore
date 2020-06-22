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
      //buyController.calcPriceByQuantityPlus(30);
    });

    test(
        "calcPriceByQuantitySub with quantity to 1 should be return the same price sent",
        () {});

    test(
        "calcPriceByQuantitySub with quantity to 1 should be return the same price sent",
        () {
      // buyController.calcPriceByQuantityPlus(30);
      // buyController.calcPriceByQuantityPlus(30);
      // buyController.calcPriceByQuantityPlus(30);

      // buyController.calcPriceByQuantitySub(30);
    });
  });
}
