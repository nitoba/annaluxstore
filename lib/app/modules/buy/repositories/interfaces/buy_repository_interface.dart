import 'package:annaluxstore/app/modules/buy/models/coupom_model.dart';
import 'package:annaluxstore/app/modules/buy/models/rate_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

abstract class IBuyRepository {
  Future<List<CoupomModel>> getCoupons();
  Future<RateModel> getDelireryRate(UserModel userModel);
}
