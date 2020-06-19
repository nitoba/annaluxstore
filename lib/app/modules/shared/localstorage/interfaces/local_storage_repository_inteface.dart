abstract class ISharedLocalRepository {
  Future<bool> getIsLogin(String key);
  Future<void> setIsLogin(String key, bool value);
}
