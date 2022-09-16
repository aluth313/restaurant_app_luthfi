import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant_detail');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://restaurant-api.dicoding.dev/images/medium/14'))),
            ),
            Expanded(
              child: Container(
                // color: Colors.yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Melting Pot'),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                        ),
                        Text('Medan')
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_outlined,
                        ),
                        Text('4.6')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
