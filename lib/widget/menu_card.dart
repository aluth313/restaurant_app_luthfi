import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(bottom: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Color(0xffF3F3F3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food.jpg'))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text('Paket rosemary', style: Theme.of(context).textTheme.bodyLarge,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Text('IDR 15.000', style: Theme.of(context).textTheme.caption,),
          ),
        ],
      ),
    );
  }
}
