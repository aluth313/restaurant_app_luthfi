import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final RestaurantService restaurantService;

  RestaurantProvider({required this.restaurantService}) {
    _fetchAllRestaurant();
  }

  late Restaurant _restaurant;
  late RestaurantDetailModel _restaurantDetailModel;
  late RestaurantSearchModel _restaurantSearchModel;
  late ResultState _state;
  late ResultState _stateDetail;
  late ResultState _stateSearch;
  String _message = '';

  String get message => _message;

  Restaurant get result => _restaurant;
  RestaurantDetailModel get resultDetail => _restaurantDetailModel;
  RestaurantSearchModel get resultSearch => _restaurantSearchModel;

  ResultState get state => _state;
  ResultState get stateDetail => _stateDetail;
  ResultState get stateSearch => _stateSearch;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await restaurantService.restaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Data Kosong';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurant = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan ketika mengambil data dari internet';
    }
  }
  
  Future<dynamic> detailRestaurant(String id) async {
    try {
      _stateDetail = ResultState.loading;
      notifyListeners();
      final restaurant = await restaurantService.restaurantDetail(id);
      if (restaurant.restaurantDetailItem == null) {
        _stateDetail = ResultState.noData;
        notifyListeners();
        return _message = 'Data Kosong';
      } else {
        _stateDetail = ResultState.hasData;
        notifyListeners();
        return _restaurantDetailModel = restaurant;
      }
    } catch (e) {
      _stateDetail = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan ketika mengambil data dari internet';
    }
  }
  
  Future<dynamic> searchRestaurant(String query) async {
    try {
      _stateSearch = ResultState.loading;
      notifyListeners();
      final restaurant = await restaurantService.searchRestaurant(query);
      if (restaurant.restaurants.isEmpty) {
        _stateSearch = ResultState.noData;
        notifyListeners();
        return _message = 'Restoran tidak ditemukan';
      } else {
        _stateSearch = ResultState.hasData;
        notifyListeners();
        return _restaurantSearchModel = restaurant;
      }
    } catch (e) {
      _stateSearch = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan ketika mengambil data dari internet';
    }
  }
}
