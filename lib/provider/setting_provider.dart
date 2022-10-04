import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool _isActive = false;

  bool get isActive => _isActive;

  void setNotif(bool value){
    // nanti ini diganti
    _isActive = value;
    notifyListeners();
  }
}