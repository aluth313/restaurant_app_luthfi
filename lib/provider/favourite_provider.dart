import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class FavouriteProvider extends ChangeNotifier {
  List<RestaurantElement> _restaurants = [];
  late DatabaseHelper _dbHelper;
  ResultState _state = ResultState.noData;
  String _message = '';

  List<RestaurantElement> get restaurants => _restaurants;
  ResultState get state => _state;
  String get message => _message;

  FavouriteProvider(){
    _dbHelper = DatabaseHelper();
    _getAllRestaurantFavourites();
  }

  void _getAllRestaurantFavourites() async {
    _restaurants = await _dbHelper.getFavourites();
    if (_restaurants.isNotEmpty) {
      _state = ResultState.hasData;
    }else{
      _state = ResultState.noData;
      _message = 'Belum Ada Restoran Favorit';
    }
    notifyListeners();
  }

  void addFavoutire(RestaurantElement restaurantElement) async {
    try {
      await _dbHelper.insertFavourite(restaurantElement);
      _getAllRestaurantFavourites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Terjadi kesalahan ketika menambahkan ke favorit';
      notifyListeners();
    }
  }

  Future<bool> isFavourite(String id) async {
    final favouriteRestaurant = await _dbHelper.getRestaurantFavouriteById(id);
    return favouriteRestaurant.isNotEmpty;
  }

  void deleteFavourite(String id) async {
    await _dbHelper.removeFavourite(id);
    _getAllRestaurantFavourites();
  }
}