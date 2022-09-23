import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/restaurant_list', (route) => false);
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash.png'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  whiteColor.withOpacity(0),
                  blackColor.withOpacity(0.75)
                ])),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                'Get Your Favourite Foods',
                style: splashText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
