import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/restaurant_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantElement restaurantElement;
  final VoidCallback onTap;

  const RestaurantCard({
    super.key,
    required this.restaurantElement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Hero(
              tag:
                  '${RestaurantService.baseUrlImage}medium/${restaurantElement.pictureId}',
              child: Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${RestaurantService.baseUrlImage}small/${restaurantElement.pictureId}'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantElement.name,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
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
                      Text(
                        restaurantElement.city,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        size: 18,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        restaurantElement.rating.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
