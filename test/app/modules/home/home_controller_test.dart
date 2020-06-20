import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(
    HomeModule(),
  );
  //HomeController homeController;
  //
  setUp(() {
    //homeController = HomeModule.to.get<HomeController>();
  });

  // group('HomeController Test', () {
  //     test("First Test", () {
  //       expect(homeController, isInstanceOf<HomeController>());
  //     });

  //     test("When call function getCategories should be return all categories the database", () {
  //       expect(homeController.value, equals(0));
  //       homeController.increment();
  //       expect(homeController.value, equals(1));
  //     });
  // });
}
