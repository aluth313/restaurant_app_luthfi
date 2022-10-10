import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final RestaurantService restaurantService;

  late RestaurantDetailModel _restaurantDetailModel;
  late ResultState _stateDetail;
  String _message = '';

  DetailRestaurantProvider({required this.restaurantService}) {
    _stateDetail = ResultState.loading;
  }

  String get message => _message;
  RestaurantDetailModel get resultDetail => _restaurantDetailModel;
  ResultState get stateDetail => _stateDetail;

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
}
