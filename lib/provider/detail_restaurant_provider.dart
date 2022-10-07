import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final RestaurantService restaurantService;

  // late Restaurant _restaurant;
  late RestaurantDetailModel _restaurantDetailModel;
  // late RestaurantSearchModel _restaurantSearchModel;
  // late ResultState _state;
  late ResultState _stateDetail;
  // late ResultState _stateSearch;
  String _message = '';
  // final _searchController = TextEditingController(text: '');

  DetailRestaurantProvider({required this.restaurantService}) {
    _stateDetail = ResultState.loading;
  }

  String get message => _message;

  // Restaurant get result => _restaurant;
  RestaurantDetailModel get resultDetail => _restaurantDetailModel;
  // RestaurantSearchModel get resultSearch => _restaurantSearchModel;

  // ResultState get state => _state;
  ResultState get stateDetail => _stateDetail;
  // ResultState get stateSearch => _stateSearch;
  // TextEditingController get searchController => _searchController;

  void setStateDetailBack(){
    _stateDetail = ResultState.loading;
    notifyListeners();
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
}
