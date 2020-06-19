import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/local_storage_repository_inteface.dart';

class SharedRepository implements ISharedLocalRepository {
  @override
  Future<bool> getIsLogin(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<void> setIsLogin(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
