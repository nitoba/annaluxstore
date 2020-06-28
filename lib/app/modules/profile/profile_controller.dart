import 'dart:convert';

import 'package:annaluxstore/app/modules/profile/models/adress_model.dart';
import 'package:annaluxstore/app/modules/profile/repositories/adress_repository_interface.dart';
import 'package:annaluxstore/app/modules/shared/auth/repositories/auth_interface.dart';
import 'package:annaluxstore/app/modules/shared/localstorage/interfaces/local_storage_repository_inteface.dart';
import 'package:annaluxstore/app/modules/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase extends Disposable with Store {
  final IAuthRepository _authRepository;
  final IAdressRepository _adressRepository;
  final ISharedLocalRepository _sharedLocalRepository;

  @override
  void dispose() {
    saveUserAdress();
  }

  @observable
  UserModel user;
  @observable
  AdressModel userAdress;
  @observable
  double width = 50;
  @observable
  double opacity = 0;

  _ProfileControllerBase(this._authRepository, this._adressRepository,
      this._sharedLocalRepository) {
    getUserInfos();
    loadUserAdress();
  }
  @action
  getUserInfos() async {
    user = await _authRepository.getUser();
  }

  @action
  getUserAdress(String cep) async {
    userAdress = await _adressRepository.getUserAdress(cep.trim());
  }

  saveUserAdress() async {
    if (userAdress != null) {
      var userAdressEncoded = jsonEncode(userAdress.toJson());
      await _sharedLocalRepository.insert("adress", userAdressEncoded);
    }
  }

  @action
  loadUserAdress() async {
    var userDecoded;
    var adressLoaded = await _sharedLocalRepository.get("adress");
    if (adressLoaded != null) {
      userDecoded = jsonDecode(adressLoaded);
      userAdress = AdressModel.fromJson(userDecoded);
    }
  }

  @action
  editUserAdress() async {
    //
    if (width == 130) {
      userAdress = null;
      width = 50;
      await _sharedLocalRepository.remove("adress");
      return;
    }
    width = 130;
    Future.delayed(Duration(milliseconds: 300), () {
      opacity = 1;
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      opacity = 0;
      width = 50;
    });
  }
}
