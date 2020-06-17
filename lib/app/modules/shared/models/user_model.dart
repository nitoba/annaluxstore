import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String photoUrl;

  UserModel(
      {this.id = "", this.name = "", this.photoUrl = "", this.email = ""});

  factory UserModel.fromJson(FirebaseUser user) {
    return UserModel(
      name: user.displayName ?? "",
      photoUrl: user.photoUrl ?? "",
      email: user.email ?? "",
      id: user.uid ?? "",
    );
  }

  Map<String, dynamic> toJson() => {};
}
