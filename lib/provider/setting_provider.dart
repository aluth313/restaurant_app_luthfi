import 'package:flutter/material.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class SettingProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;
  bool _isActive = false;

  SettingProvider({required this.preferencesHelper}){
    _getDailyNewsPreferences();
  }

  bool get isActive => _isActive;

  void setNotif(bool value){
    preferencesHelper.setNotif(value);
    _getDailyNewsPreferences();
  }

  void _getDailyNewsPreferences() async {
    _isActive = await preferencesHelper.isActive;
    notifyListeners();
  }
}