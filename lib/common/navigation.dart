import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, String id, BuildContext context) {
    final provider = Provider.of<RestaurantProvider>(context, listen: false);
    provider.detailRestaurant(id);
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static back() => navigatorKey.currentState?.pop();
}
