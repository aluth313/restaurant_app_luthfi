import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, String id) {
    // redirectPage = id;
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: id,
    );
  }

  static back() => navigatorKey.currentState?.pop();
}
