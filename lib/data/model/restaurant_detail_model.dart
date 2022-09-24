import 'package:meta/meta.dart';
import 'dart:convert';

RestaurantDetailModel restaurantDetailFromJson(String str) => RestaurantDetailModel.fromJson(json.decode(str));

String restaurantDetailToJson(RestaurantDetailModel data) => json.encode(data.toJson());

class RestaurantDetailModel {
    RestaurantDetailModel({
        required this.error,
        required this.message,
        required this.restaurantDetailItem,
    });

    final bool error;
    final String message;
    final RestaurantDetailItem restaurantDetailItem;

    factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) => RestaurantDetailModel(
        error: json["error"],
        message: json["message"],
        restaurantDetailItem: RestaurantDetailItem.fromJson(json["restaurant"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurantDetailItem.toJson(),
    };
}

class RestaurantDetailItem {
    RestaurantDetailItem({
        required this.id,
        required this.name,
        required this.description,
        required this.city,
        required this.address,
        required this.pictureId,
        required this.rating,
        required this.categories,
        required this.menus,
        required this.customerReviews,
    });

    final String id;
    final String name;
    final String description;
    final String city;
    final String address;
    final String pictureId;
    final double rating;
    final List<RestaurantCategory> categories;
    final Menus menus;
    final List<CustomerReview> customerReviews;

    factory RestaurantDetailItem.fromJson(Map<String, dynamic> json) => RestaurantDetailItem(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
        categories: List<RestaurantCategory>.from(json["categories"].map((x) => RestaurantCategory.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "rating": rating,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "menus": menus.toJson(),
        "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
    };
}

class RestaurantCategory {
    RestaurantCategory({
        required this.name,
    });

    final String name;

    factory RestaurantCategory.fromJson(Map<String, dynamic> json) => RestaurantCategory(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class CustomerReview {
    CustomerReview({
        required this.name,
        required this.review,
        required this.date,
    });

    final String name;
    final String review;
    final String date;

    factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
    };
}

class Menus {
    Menus({
        required this.foods,
        required this.drinks,
    });

    final List<RestaurantCategory> foods;
    final List<RestaurantCategory> drinks;

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<RestaurantCategory>.from(json["foods"].map((x) => RestaurantCategory.fromJson(x))),
        drinks: List<RestaurantCategory>.from(json["drinks"].map((x) => RestaurantCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}
