import 'package:shared_preferences/shared_preferences.dart';

class SharefPrefs {
  SharedPreferences _preferences;

  SharefPrefs(SharedPreferences preferencesprefs) {
    this._preferences = preferencesprefs;
  }

  String getKey(String key) {
    return _preferences.getString(key);
  }
}
