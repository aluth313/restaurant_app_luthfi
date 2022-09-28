import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantSearchModel {
    RestaurantSearchModel({
        required this.error,
        required this.founded,
        required this.restaurants,
    });

    final bool error;
    final int founded;
    final List<RestaurantElement> restaurants;

    factory RestaurantSearchModel.fromJson(Map<String, dynamic> json) => RestaurantSearchModel(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantElement>.from(json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
    );
}
