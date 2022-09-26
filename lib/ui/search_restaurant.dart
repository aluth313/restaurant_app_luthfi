import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import 'package:restaurant_app/widget/textfield.dart';

class RestaurantSearch extends StatelessWidget {
  static const routeName = '/restaurant_search';

  const RestaurantSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: customStyleText.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFieldCustom(),
              // Expanded(
              //     child: Center(
              //   child: Text(
              //     'Type something for search restaurant',
              //   ),
              // )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RestaurantCard(
                      restaurantElement: RestaurantElement(
                        id: 's1knt6za9kkfw1e867',
                        name: 'Kafe Kita',
                        description: 'description',
                        pictureId: '25',
                        city: 'city',
                        rating: 4.5,
                      ),
                      onTap: () {
                        // state.detailRestaurant(
                        //     state.result.restaurants[index].id);
                        // Navigator.pushNamed(
                        //     context, RestaurantDetail.routeName);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
