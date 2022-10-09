import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:restaurant_app/provider/favourite_provider.dart';
import 'package:restaurant_app/ui/review_page.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widget/custom_button.dart';
import 'package:restaurant_app/widget/menu_card.dart';
import 'package:restaurant_app/widget/review_card.dart';

class RestaurantDetail extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final String id;

  const RestaurantDetail(this.id, {super.key});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<DetailRestaurantProvider>(context, listen: false);
      provider.detailRestaurant(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _header(RestaurantDetailItem restaurantElement) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag:
                '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}',
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: greyColor,
                child: Consumer<DetailRestaurantProvider>(
                  builder: (context, detailRestaurantProvider, _) {
                    return IconButton(
                        onPressed: () {
                          detailRestaurantProvider.setStateDetailBack();
                          Navigation.back();
                        },
                        icon: defaultTargetPlatform == TargetPlatform.android
                            ? const Icon(
                                Icons.arrow_back,
                                color: blackColor,
                              )
                            : const Icon(
                                Icons.arrow_back_ios_outlined,
                                color: blackColor,
                              ));
                  },
                ),
              ),
            ),
          ),
          Consumer<FavouriteProvider>(
            builder: (context, provider, _) {
              return FutureBuilder<bool>(
                future: provider.isFavourite(restaurantElement.id),
                builder: (context, snapshot) {
                  var isFavourite = snapshot.data ?? false;
                  return Positioned(
                    right: 1,
                    bottom: -30,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                        left: 10,
                        bottom: 10,
                        top: 10,
                      ),
                      child: SafeArea(
                        child: CircleAvatar(
                          backgroundColor: greyColor,
                          child: IconButton(
                            onPressed: () {
                              if (isFavourite) {
                                provider.deleteFavourite(restaurantElement.id);
                              } else {
                                provider.addFavoutire(
                                  RestaurantElement(
                                    id: restaurantElement.id,
                                    name: restaurantElement.name,
                                    description: restaurantElement.description,
                                    pictureId: restaurantElement.pictureId,
                                    city: restaurantElement.city,
                                    rating: restaurantElement.rating,
                                  ),
                                );
                              }
                            },
                            icon: isFavourite
                                ? const Icon(
                                    Icons.favorite_outlined,
                                    color: pinkColor,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: pinkColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      );
    }

    Widget _title(RestaurantDetailItem restaurantElement) {
      String _convertToStringCategory(List<RestaurantCategory> categories) {
        List<String> dataCategory = [];
        dataCategory = categories.map((data) => data.name).toList();
        return dataCategory.join(', ');
      }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantElement.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 18,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          restaurantElement.city,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.restaurant_outlined,
                        size: 18,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          _convertToStringCategory(
                              restaurantElement.categories),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.star_outlined,
              size: 20,
              color: yellowColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              restaurantElement.rating.toString(),
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      );
    }

    Widget _description(RestaurantDetailItem restaurantElement) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              restaurantElement.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      );
    }

    Widget _foods(RestaurantDetailItem restaurantElement) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foods',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: restaurantElement.menus.foods.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MenuCard(restaurantElement.menus.foods[index].name);
              },
            ),
          ],
        ),
      );
    }

    Widget _drinks(RestaurantDetailItem restaurantElement) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Drinks',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: restaurantElement.menus.drinks.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MenuCard(restaurantElement.menus.drinks[index].name);
              },
            ),
          ],
        ),
      );
    }

    Widget _reviews(RestaurantDetailItem restaurantElement) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                CustomButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ReviewPage.routeName,
                      arguments: restaurantElement,
                    );
                  },
                  text: 'Beri Penilaian',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: restaurantElement.customerReviews.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ReviewCard(
                  customerReview: restaurantElement.customerReviews[index],
                );
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Consumer<DetailRestaurantProvider>(
        builder: (context, data, child) {
          if (data.stateDetail == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.stateDetail == ResultState.hasData) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: const ScrollPhysics(),
              children: [
                _header(data.resultDetail.restaurantDetailItem),
                _title(data.resultDetail.restaurantDetailItem),
                _description(data.resultDetail.restaurantDetailItem),
                _foods(data.resultDetail.restaurantDetailItem),
                _drinks(data.resultDetail.restaurantDetailItem),
                _reviews(data.resultDetail.restaurantDetailItem),
              ],
            );
          } else if (data.stateDetail == ResultState.noData) {
            return Center(
              child: Text(data.message),
            );
          } else if (data.stateDetail == ResultState.error) {
            return Center(
              child: Text(data.message),
            );
          } else {
            return const Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}
