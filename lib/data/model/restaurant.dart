import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

List<RestaurantElement> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed
      .map((parsed) => RestaurantElement.fromJson(parsed))
      .toList();
}

class Restaurant {
    Restaurant({
        required this.error,
        required this.message,
        required this.count,
        required this.restaurants,
    });

    final bool error;
    final String message;
    final int count;
    final List<RestaurantElement> restaurants;

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantElement>.from(json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    };
}

class RestaurantElement {
    RestaurantElement({
        required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
    });

    final String id;
    final String name;
    final String description;
    final String pictureId;
    final String city;
    final double rating;

    factory RestaurantElement.fromJson(Map<String, dynamic> json) => RestaurantElement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
    };
}
