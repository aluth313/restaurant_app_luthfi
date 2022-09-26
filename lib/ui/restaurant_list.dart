import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/ui/search_restaurant.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RestaurantSearch.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerRight,
                  child: Icon(
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
                    return Center(
                      child: CircularProgressIndicator(),
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
                            Navigator.pushNamed(
                                context, RestaurantDetail.routeName);
                          },
                        );
                      },
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state.state == ResultState.error) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: Text(''),
                    );
                  }
                },
              ),
              // FutureBuilder(
              //   future: DefaultAssetBundle.of(context)
              //       .loadString('assets/local_restaurant.json'),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(content: Text('Data gagal ditampilkan.')));
              //       return Center(child: Text('Data gagal ditampilkan.'));
              //     }

              //     if (snapshot.hasData) {
              //       final List<RestaurantElement> restaurants =
              //           parseRestaurants(snapshot.data);
              //       return ListView.builder(
              //         itemCount: restaurants.length,
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemBuilder: (context, index) {
              //           return RestaurantCard(
              //             restaurantElement: restaurants[index],
              //           );
              //         },
              //       );
              //     }

              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
