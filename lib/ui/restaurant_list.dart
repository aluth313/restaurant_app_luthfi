import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/ui/search_restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 30.0,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  final restoProv =
                      Provider.of<RestaurantProvider>(context, listen: false);
                  restoProv.setSearch('');
                  Navigator.pushNamed(context, RestaurantSearch.routeName);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
              Text(
                'Restaurant',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Recommendation restaurant for you!',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Consumer<RestaurantProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.state == ResultState.hasData) {
                    return ListView.builder(
                      itemCount: state.result.restaurants.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RestaurantCard(
                          restaurantElement: state.result.restaurants[index],
                          onTap: () {
                            state.detailRestaurant(
                                state.result.restaurants[index].id);
                            // Navigation.intentWithData(RestaurantDetail.routeName, state.resultDetail);
                            Navigator.pushNamed(
                                context, RestaurantDetail.routeName);
                          },
                        );
                      },
                    );
                  } else if (state.state == ResultState.noData) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3,
                      ),
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else if (state.state == ResultState.error) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3,
                      ),
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3,
                      ),
                      child: const Center(
                        child: Text(''),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
