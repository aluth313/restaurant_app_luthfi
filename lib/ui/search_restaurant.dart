import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
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
          child: Column(
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
                  print(value);
                },
                controller: searchController,
                suffixIcon: Icon(
                  Icons.clear_outlined,
                  color: redColor,
                ),
                onTapSuffixIcon: () {},
                hintText: 'Search...',
              ),
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
