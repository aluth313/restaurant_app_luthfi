
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int _page = 0;

  int get page => _page;

  void setPage(BuildContext context, int index){
    _page = index;
    notifyListeners();
  }
}