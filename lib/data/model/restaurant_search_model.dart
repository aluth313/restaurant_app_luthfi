import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant.dart';

RestaurantSearchModel restaurantSearchModelFromJson(String str) => RestaurantSearchModel.fromJson(json.decode(str));

String restaurantSearchModelToJson(RestaurantSearchModel data) => json.encode(data.toJson());

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
        restaurants: List<RestaurantElement>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    };
}
