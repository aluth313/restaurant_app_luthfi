import 'package:flutter/material.dart';

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
                  margin: EdgeInsets.only(top: 20), child: Text('Restaurant')),
              Text('Recommendation restauran for you!'),
              ListView.builder(
                itemCount: 50,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text('data');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
