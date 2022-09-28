import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import 'package:restaurant_app/widget/textfield.dart';

class RestaurantSearch extends StatefulWidget {
  static const routeName = '/restaurant_search';

  const RestaurantSearch({super.key});

  @override
  State<RestaurantSearch> createState() => _RestaurantSearchState();
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Consumer<RestaurantProvider>(
            builder: (context, state, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: greyColor,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: defaultTargetPlatform == TargetPlatform.android
                              ? Icon(
                                  Icons.arrow_back,
                                  color: blackColor,
                                )
                              : Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: blackColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Search',
                        style: customStyleText.copyWith(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  TextFieldCustom(
                    onChanged: (value) {
                      state.setSearch(value);
                      if (value.isNotEmpty) {
                        state.searchRestaurant(value);
                      }
                    },
                    controller: searchController,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                    ),
                    hintText: 'Search...',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: state.searchController.text.isEmpty
                        ? Center(
                            child: Text(
                              'Input untuk mencari data Restoran.',
                            ),
                          )
                        : _result(state),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _result(RestaurantProvider state) {
    if (state.stateSearch == ResultState.hasData) {
      return ListView.builder(
        itemCount: state.resultSearch.restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantCard(
            restaurantElement: RestaurantElement(
              id: state.resultSearch.restaurants[index].id,
              name: state.resultSearch.restaurants[index].name,
              description: state.resultSearch.restaurants[index].description,
              pictureId: state.resultSearch.restaurants[index].pictureId,
              city: state.resultSearch.restaurants[index].city,
              rating: state.resultSearch.restaurants[index].rating,
            ),
            onTap: () {
              state.detailRestaurant(state.resultSearch.restaurants[index].id);
              Navigator.pushNamed(context, RestaurantDetail.routeName);
            },
          );
        },
      );
    } else if (state.stateSearch == ResultState.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.stateSearch == ResultState.noData) {
      return Center(
        child: Text(state.message),
      );
    } else if (state.stateSearch == ResultState.error) {
      return Center(
        child: Text(state.message),
      );
    } else {
      return Center(
        child: Text(''),
      );
    }
  }
}
