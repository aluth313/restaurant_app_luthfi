import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/page_provider.dart';
import 'package:restaurant_app/ui/detail_restaurant.dart';
import 'package:restaurant_app/ui/favourite_page.dart';
import 'package:restaurant_app/ui/restaurant_list.dart';
import 'package:restaurant_app/ui/setting_page.dart';
import 'package:restaurant_app/utils/notification_helper.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantDetail.routeName, context);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidget = [
      const RestaurantList(),
      const FavouritePage(),
      const SettingPage(),
    ];

    final List<BottomNavigationBarItem> bottomNavigationBarItems = [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border_outlined,
        ),
        label: 'Favorite',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
        ),
        label: 'Settings',
      ),
    ];

    return Consumer<PageProvider>(
      builder: (context, data, _) {
        return Scaffold(
          body: listWidget[data.page],
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavigationBarItems,
            selectedItemColor: blueColor,
            currentIndex: data.page,
            onTap: (value) {
              data.setPage(value);
            },
          ),
        );
      },
    );
  }
}
