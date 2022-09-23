import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widget/menu_card.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final RestaurantElement restaurantElement;

  const RestaurantDetail(this.restaurantElement, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget _header() {
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

    Widget _title() {
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
                      Text(
                        restaurantElement.city,
                        style: Theme.of(context).textTheme.bodyText2,
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

    Widget _description() {
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

    Widget _foods() {
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
            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 200,
            //       crossAxisSpacing: 5,
            //       mainAxisSpacing: 5),
            //   itemCount: restaurantElement.menus.foods.length,
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return MenuCard(restaurantElement.menus.foods[index].name);
            //   },
            // ),
          ],
        ),
      );
    }

    Widget _drinks() {
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
            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 200,
            //       crossAxisSpacing: 5,
            //       mainAxisSpacing: 5),
            //   itemCount: restaurantElement.menus.drinks.length,
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return MenuCard(restaurantElement.menus.drinks[index].name);
            //   },
            // ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        physics: ScrollPhysics(),
        children: [
          _header(),
          _title(),
          _description(),
          _foods(),
          _drinks(),
        ],
      ),
    );
  }
}
