import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/home/home_controller.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:mobx/mobx.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final HomeController _homeController;
  final ISharedLocalRepository _sharedLocalRepository;
  @observable
  ObservableList<ProductModelStore> favoriteProducts;

  _FavoritesControllerBase(this._homeController, this._sharedLocalRepository);

  @action
  getFavoriteProducts() {
    var favorites = _homeController.favoriteProducts;

    var storeProductModel = ProductModelStore();

    favoriteProducts = favorites
        .map((product) => storeProductModel.transformModel(product))
        .toList()
        .asObservable();

    //print(favoriteProducts);
  }

  @action
  removeFavoriteProducts(ProductModelStore productModelStore) async {
    if (favoriteProducts != null) {
      favoriteProducts.removeWhere(
        (favoriteProduct) => favoriteProduct.id == productModelStore.id,
      );

      _homeController.removeFavoriteProducts(productModelStore.id);
    }
  }

  remove(ObservableList<ProductModelStore> favoriteProducts) async {
    List<String> listStrings =
        favoriteProducts.map((e) => e.toString()).toList();

    await _sharedLocalRepository.insert('favorites', listStrings);
  }
}
