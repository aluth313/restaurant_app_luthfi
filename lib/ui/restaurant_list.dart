import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
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
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Restaurant',
                    style: Theme.of(context).textTheme.headline4,
                  )),
              Text(
                'Recommendation restauran for you!',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  // final List<Restaurant> restaurants = 
                  return ListView.builder(
                    itemCount: 50,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RestaurantCard();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
