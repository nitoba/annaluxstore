import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/local_storage_repository_inteface.dart';

class SharedRepository implements ISharedLocalRepository {
  @override
  Future get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future insert(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else if (value is List<dynamic>) {
      prefs.setStringList(key, value);
    }
  }

  @override
  Future remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
