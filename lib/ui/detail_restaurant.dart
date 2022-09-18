import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/widget/menu_card.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  const RestaurantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
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
                    'https://restaurant-api.dicoding.dev/images/medium/14'))),
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
              'Restaurant 1',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8,),
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
                  'Medan',
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
            Text('Description', style: Theme.of(context).textTheme.headline6,),
            SizedBox(
              height: 10,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      );
    }

    Widget _menus() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Menus', style: Theme.of(context).textTheme.headline6,),
            // SizedBox(
            //   height: 8,
            // ),
            // Text('Foods'),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                MenuCard(),
                MenuCard(),
                MenuCard(),
                MenuCard(),
                MenuCard(),
                MenuCard(),
                MenuCard(),
              ],
            )
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
