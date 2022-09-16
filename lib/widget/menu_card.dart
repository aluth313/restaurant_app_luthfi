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
          borderRadius: BorderRadius.circular(18), color: Colors.yellow),
    );
  }
}
