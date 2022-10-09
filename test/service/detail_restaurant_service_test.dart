import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  test(
    'should success parse json and get api',
    () async {
      final restaurantService = RestaurantService();

      restaurantService.client = MockClient((request) async {
        final jsonMap = {
          "error": false,
          "message": "success",
          "restaurant": {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description":
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
            "city": "Medan",
            "address": "Jln. Pandeglang no 19",
            "pictureId": "14",
            "rating": 4.2,
            "categories": [
              {
                "name": "Italia",
              },
              {
                "name": "Modern",
              }
            ],
            "menus": {
              "foods": [
                {
                  "name": "Paket rosemary",
                },
              ],
              "drinks": [
                {
                  "name": "Es krim",
                },
              ]
            },
            "customerReviews": [
              {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019",
              },
            ]
          }
        };
        return Response(json.encode(jsonMap), 200);
      });
      final getRestaurant =
          await restaurantService.restaurantDetail('rqdv5juczeskfw1e867');

      expect(getRestaurant, isA<RestaurantDetailModel>());
    },
  );
}
