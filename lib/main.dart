import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
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
      create: (context) => RestaurantProvider(
        restaurantService: RestaurantService(),
      ),
      child: MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        builder: EasyLoading.init(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          RestaurantList.routeName: (context) => const RestaurantList(),
          RestaurantDetail.routeName: (context) => const RestaurantDetail(),
          RestaurantSearch.routeName: (context) => const RestaurantSearch(),
          ReviewPage.routeName: (context) => ReviewPage(
                ModalRoute.of(context)?.settings.arguments
                    as RestaurantDetailItem,
              ),
        },
      ),
    );
  }
}
