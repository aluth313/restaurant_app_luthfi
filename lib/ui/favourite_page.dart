import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/favourite_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

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
                'Favourites',
                style: customStyleText.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Consumer<FavouriteProvider>(
                  builder: (context, provider, child) {
                    if (provider.state == ResultState.hasData) {
                      return ListView.builder(
                        itemCount: provider.restaurants.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RestaurantCard(
                            restaurantElement: provider.restaurants[index],
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RestaurantDetail.routeName,
                                arguments: provider.restaurants[index].id,
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          provider.message,
                          style: customStyleText,
                        ),
                      );
                    }
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
