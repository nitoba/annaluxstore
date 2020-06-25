import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';

abstract class IBuyRepository {
  Future<List<CoupomModel>> getCoupons();
}
