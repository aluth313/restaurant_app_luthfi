import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_list.dart';
import 'package:restaurant_app/ui/review_page.dart';
import 'package:restaurant_app/ui/search_restaurant.dart';
import 'package:restaurant_app/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (context) =>
          RestaurantProvider(restaurantService: RestaurantService()),
      child: MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          RestaurantList.routeName: (context) => RestaurantList(),
          RestaurantDetail.routeName: (context) => RestaurantDetail(),
          RestaurantSearch.routeName: (context) => RestaurantSearch(),
          ReviewPage.routeName: (context) => ReviewPage(),
        },
      ),
    );
  }
}
