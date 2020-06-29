import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';

class CheckoutModel {
  UserModel user;
  AdressModel adress;
  List<ProductModelStore> products;

  CheckoutModel({this.user, this.adress, this.products});

  // factory CheckoutModel.fromJson(DocumentSnapshot doc) {
  //   return CheckoutModel(

  //   );
  //   user: UserModel.fromJson(doc.data['']);
  //   adress =
  //       json['adress'] != null ? new Adress.fromJson(json['adress']) : null;
  //   if (json['products'] != null) {
  //     products = new List<Products>();
  //     json['products'].forEach((v) {
  //       products.add(new Products.fromJson(v));
  //     });
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.adress != null) {
      data['adress'] = this.adress.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toOrder()).toList();
    }
    return data;
  }
}
