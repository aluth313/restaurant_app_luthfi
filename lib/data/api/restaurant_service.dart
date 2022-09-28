import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';

class RestaurantService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String baseUrlImage = '${_baseUrl}images/';

  Future<Restaurant> restaurantList() async {
    final response = await http.get(Uri.parse('${_baseUrl}list'));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load list');
    }
  }

  Future<RestaurantDetailModel> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse('${_baseUrl}detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get restaurant');
    }
  }

  Future<RestaurantSearchModel> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse('${_baseUrl}search?q=$query'));
    if (response.statusCode == 200) {
      return RestaurantSearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to search');
    }
  }

  Future<dynamic> review(String id, String name, String review) async {
    final response = await http.post(Uri.parse('${_baseUrl}review'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'id': id,
          'name': name,
          'review': review,
        }));
    if (response.statusCode == 201) {
      return response.statusCode;
    } else {
      throw Exception('Failed to review');
    }
  }
}
