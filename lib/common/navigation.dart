import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, String id) {
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: id,
    );
  }

  static back() => navigatorKey.currentState?.pop();
}
