import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/page_provider.dart';
import 'package:restaurant_app/ui/restaurant_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _listWidget = [
      RestaurantList(),
      Center(
        child: Text('Favourite'),
      ),
      Center(
        child: Text('Setting'),
      ),
    ];

    final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border_outlined,
        ),
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
        ),
        label: 'Settings',
      ),
    ];

    return Consumer<PageProvider>(
      builder: (context, data, _) {
        return Scaffold(
          body: _listWidget[data.page],
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomNavigationBarItems,
            selectedItemColor: blueColor,
            currentIndex: data.page,
            onTap: (value) {
              data.setPage(context, value);
            },
          ),
        );
      },
    );
  }
}
