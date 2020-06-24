import 'dart:convert';

import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/home/models/product_model.dart';
import 'package:annaluxstore/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository _homeRepository;
  final ISharedLocalRepository _sharedLocalRepository;
  @observable
  int currentIndex = 0;

  List<ProductModel> productsToCar = [];

  List<CoupomModel> coupons = [];

  _HomeControllerBase(this._homeRepository, this._sharedLocalRepository) {
    getCupons();
  }

  @action
  void updateCurrentIndex(int index) {
    this.currentIndex = index;
  }

  List<ProductModel> addProductToCar(ProductModel productModel) {
    productsToCar.add(productModel);
    return productsToCar;
  }

  removeProductToCar(String id) {
    productsToCar.removeWhere((element) => element.id == id);
  }

  getCupons() async {
    coupons = await _homeRepository.getCoupons();
  }

  saveCupons(CoupomModel cupomModel) async {
    var encondedCupom = jsonEncode(cupomModel);

    List<String> cuponsLoaded =
        await _sharedLocalRepository.get('coupons') ?? [];

    var isMatch =
        cuponsLoaded.where((cupom) => cupom == encondedCupom).toList();

    if (isMatch.isNotEmpty) {
      //print("Já existe esse cupom salvo");
      return;
    } else {
      //print("Não existe esse cupom salvo");

      cuponsLoaded.add(encondedCupom);

      await _sharedLocalRepository.insert('coupons', cuponsLoaded);
    }
  }

  Future<List<CoupomModel>> loadCoupons() async {
    List cupons = await _sharedLocalRepository.get('coupons');

    List<CoupomModel> coupons = [];

    Map<String, dynamic> cuponsDecoded = {};

    if (cupons != null) {
      cupons.forEach((cupom) {
        cuponsDecoded = jsonDecode(cupom);
      });

      coupons =
          cupons.map((cupom) => CoupomModel.fromJson(cuponsDecoded)).toList();
    }

    return coupons;
  }

  remove() async {
    await _sharedLocalRepository.remove('coupons');
    List cupons = await _sharedLocalRepository.get('coupons');
    print(cupons);
  }
}
