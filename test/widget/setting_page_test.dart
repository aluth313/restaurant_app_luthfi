import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/provider/setting_provider.dart';
import 'package:restaurant_app/ui/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget createSettingPage() => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SchedulingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        home: SettingPage(),
      ),
    );

void main() {
  testWidgets(
    'Testing if Switch is exist',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        createSettingPage(),
      );
      expect(find.byType(Switch), findsOneWidget);
    },
  );
}
