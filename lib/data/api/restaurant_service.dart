import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';

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
      throw Exception('Failed to load list');
    }
  }
}