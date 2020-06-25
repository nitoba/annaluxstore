import 'package:annaluxstore/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';

import 'package:annaluxstore/app/modules/home/pages/product_detail_page/product_detail/product_detail_controller.dart';
import 'package:annaluxstore/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class SharedLocalMock extends Mock implements ISharedLocalRepository {}

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<ISharedLocalRepository>((i) => SharedLocalMock()),
  ]);
  initModule(HomeModule());
  ProductDetailController productdetail;
  //
  setUp(() {
    productdetail = HomeModule.to.get<ProductDetailController>();
  });

  group('ProductDetailController Test', () {
    test("First Test", () {
      expect(productdetail, isInstanceOf<ProductDetailController>());
    });

    //   test("Set Value", () {
    //     expect(productdetail.value, equals(0));
    //     productdetail.increment();
    //     expect(productdetail.value, equals(1));
    //   });
  });
}
