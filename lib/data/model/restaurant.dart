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
}
