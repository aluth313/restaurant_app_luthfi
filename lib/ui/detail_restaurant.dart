import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widget/custom_button.dart';
import 'package:restaurant_app/widget/menu_card.dart';
import 'package:restaurant_app/widget/review_card.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  const RestaurantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _header(RestaurantDetailItem restaurantElement) {
      return Stack(
        children: [
          Hero(
            tag:
                '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}',
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}'))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: CircleAvatar(
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
                          )),
              ),
            ),
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20),
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
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 18,
                        color: secondaryColor,
                      ),
                      SizedBox(
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
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_outlined,
                        size: 18,
                        color: secondaryColor,
                      ),
                      SizedBox(
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
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.star_outlined,
              size: 20,
              color: yellowColor,
            ),
            SizedBox(
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foods',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: restaurantElement.menus.foods.length,
              physics: NeverScrollableScrollPhysics(),
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Drinks',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: restaurantElement.menus.drinks.length,
              physics: NeverScrollableScrollPhysics(),
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20, bottom: 20),
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
                CustomButton(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: restaurantElement.customerReviews.length,
              physics: NeverScrollableScrollPhysics(),
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
      body: Consumer<RestaurantProvider>(
        builder: (context, data, child) {
          if (data.stateDetail == ResultState.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.stateDetail == ResultState.hasData) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
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
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}

// class _RestaurantDetailState extends State<RestaurantDetail> {
//   @override
//   void initState() {
//     super.initState();
//     final dataDetailRestaurant =
//         Provider.of<RestaurantProvider>(context, listen: false);
//     dataDetailRestaurant.detailRestaurant(widget.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget _header(restaurantElement) {
//       return Stack(
//         children: [
//           Hero(
//             tag:
//                 '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}',
//             child: Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(18),
//                     bottomRight: Radius.circular(18),
//                   ),
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}'))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SafeArea(
//               child: CircleAvatar(
//                 backgroundColor: greyColor,
//                 child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: defaultTargetPlatform == TargetPlatform.android
//                         ? Icon(
//                             Icons.arrow_back,
//                             color: blackColor,
//                           )
//                         : Icon(
//                             Icons.arrow_back_ios_outlined,
//                             color: blackColor,
//                           )),
//               ),
//             ),
//           )
//         ],
//       );
//     }

//     Widget _title(RestaurantDetailItem restaurantElement) {
//       String _convertToStringCategory(List<RestaurantCategory> categories) {
//         List<String> dataCategory = [];
//         dataCategory = categories.map((data) => data.name).toList();
//         return dataCategory.join(', ');
//       }

//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         margin: EdgeInsets.only(top: 20),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     restaurantElement.name,
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.place_outlined,
//                         size: 18,
//                         color: secondaryColor,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: Text(
//                           restaurantElement.city,
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.restaurant_outlined,
//                         size: 18,
//                         color: secondaryColor,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(
//                         child: Text(
//                           _convertToStringCategory(
//                               restaurantElement.categories),
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 8,
//             ),
//             Icon(
//               Icons.star_outlined,
//               size: 20,
//               color: yellowColor,
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Text(
//               restaurantElement.rating.toString(),
//               style: Theme.of(context).textTheme.headline6,
//             )
//           ],
//         ),
//       );
//     }

//     Widget _description(RestaurantDetailItem restaurantElement) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         margin: EdgeInsets.only(top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Description',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               restaurantElement.description,
//               textAlign: TextAlign.justify,
//               style: Theme.of(context).textTheme.bodyText2,
//             )
//           ],
//         ),
//       );
//     }

//     Widget _foods(RestaurantDetailItem restaurantElement) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         margin: EdgeInsets.only(top: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Foods',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GridView.builder(
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 200,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5),
//               itemCount: restaurantElement.menus.foods.length,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return MenuCard(restaurantElement.menus.foods[index].name);
//               },
//             ),
//           ],
//         ),
//       );
//     }

//     Widget _drinks(RestaurantDetailItem restaurantElement) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         margin: EdgeInsets.only(top: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Drinks',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GridView.builder(
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 200,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5),
//               itemCount: restaurantElement.menus.drinks.length,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return MenuCard(restaurantElement.menus.drinks[index].name);
//               },
//             ),
//           ],
//         ),
//       );
//     }

//     Widget _reviews(RestaurantDetailItem restaurantElement) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         margin: EdgeInsets.only(top: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Reviews',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ListView.builder(
//               itemCount: restaurantElement.customerReviews.length,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return ReviewCard(
//                   customerReview: restaurantElement.customerReviews[index],
//                 );
//               },
//             )
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       body: Consumer<RestaurantProvider>(
//         builder: (context, data, child) {
//           if (data.stateDetail == ResultState.loading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (data.stateDetail == ResultState.hasData) {
//             return ListView(
//               padding: EdgeInsets.zero,
//               physics: ScrollPhysics(),
//               children: [
//                 _header(data.resultDetail.restaurantDetailItem),
//                 _title(data.resultDetail.restaurantDetailItem),
//                 _description(data.resultDetail.restaurantDetailItem),
//                 _foods(data.resultDetail.restaurantDetailItem),
//                 _drinks(data.resultDetail.restaurantDetailItem),
//                 _reviews(data.resultDetail.restaurantDetailItem),
//               ],
//             );
//           } else if (data.stateDetail == ResultState.noData) {
//             return Center(
//               child: Text(data.message),
//             );
//           } else if (data.stateDetail == ResultState.error) {
//             return Center(
//               child: Text(data.message),
//             );
//           } else {
//             return Center(
//               child: Text(''),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
