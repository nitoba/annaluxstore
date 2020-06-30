import 'package:annaluxstore/app/modules/buy/models/product_store_model.dart';
import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';

class CheckoutModel {
  String userId;
  String userName;
  String userEmail;
  String status;
  AdressModel adress;
  List<ProductModelStore> products;

  CheckoutModel({
    this.adress,
    this.products,
    this.userId,
    this.userName,
    this.userEmail,
    this.status,
  });

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

    data['userID'] = this.userId;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['orderStatus'] = this.status;

    if (this.adress != null) {
      data['adress'] = this.adress.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toOrder()).toList();
    }
    return data;
  }
}
