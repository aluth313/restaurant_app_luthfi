import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widget/menu_card.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final RestaurantElement restaurantElement;

  const RestaurantDetail(this.restaurantElement, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Hero(
        tag: restaurantElement.pictureId,
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
                  image: NetworkImage(restaurantElement.pictureId))),
        ),
      );
    }

    Widget _title() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20),
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

    Widget _menus() {
      List menuList = [
        ...restaurantElement.menus.foods,
        ...restaurantElement.menus.drinks
      ];
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menus',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  // childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: menuList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MenuCard(menuList[index].name);
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          _header(),
          _title(),
          _description(),
          _menus(),
        ],
      ),
    );
  }
}
