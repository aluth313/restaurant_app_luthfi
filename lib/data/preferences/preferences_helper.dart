import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;
  static const dailyNews = 'DAILY_NEWS';

  PreferencesHelper({required this.sharedPreferences});

  Future<bool> get isActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNews) ?? false;
  }

  void setNotif(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNews, value);
  }
}