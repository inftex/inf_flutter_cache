import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static CacheManager? _instance;

  static CacheManager get instance {
    _instance ??= CacheManager();
    return _instance!;
  }

  CacheManager();

  Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<void> write<T>(String key, T value) async {
    final pref = await getPrefs();
    if (T == bool) {
      pref.setBool(key, value as bool);
    } else if (T == double) {
      pref.setDouble(key, value as double);
    } else if (T == int) {
      pref.setInt(key, value as int);
    } else if (T == String) {
      pref.setString(key, value as String);
    } else if (T == List<String>) {
      pref.setStringList(key, value as List<String>);
    }
  }

  Future<T?> read<T>(String key) async {
    final pref = await getPrefs();
    T? value;
    if (T == bool) {
      value = pref.getBool(key) as T?;
    } else if (T == double) {
      value = pref.getDouble(key) as T?;
    } else if (T == int) {
      value = pref.getInt(key) as T?;
    } else if (T == String) {
      value = pref.getString(key) as T?;
    } else if (T == List<String>) {
      value = pref.getStringList(key) as T?;
    }
    return value;
  }

  Future<bool> remove(String key) async {
    final pref = await getPrefs();
    return pref.remove(key);
  }
}
