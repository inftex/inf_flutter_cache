import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static CacheManager? _instance;

  static get instance {
    _instance ??= CacheManager();
    return _instance;
  }

  CacheManager();

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<void> write<T>(String key, T value) async {
    final pref = await getPrefs();
    if (T is bool) {
      pref.setBool(key, value as bool);
    } else if (T is double) {
      pref.setDouble(key, value as double);
    } else if (T is int) {
      pref.setInt(key, value as int);
    } else if (T is String) {
      pref.setString(key, value as String);
    }
  }

  Future<T?> get<T>(String key) async {
    final pref = await getPrefs();
    if (T is bool) {
      return pref.getBool(key) as Future<T?>;
    } else if (T is double) {
      return pref.getDouble(key) as Future<T?>;
    } else if (T is int) {
      return pref.getInt(key) as Future<T?>;
    } else if (T is String) {
      return pref.getString(key) as Future<T?>;
    }
    return null;
  }

  Future<bool> remove<T>(String key) async {
    final pref = await getPrefs();
    return pref.remove(key);
  }
}
